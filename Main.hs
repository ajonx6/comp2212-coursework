import Lexer ( alexScanTokens )
import Grammar ( parseCalc, Program(..) )
import System.Environment ( getArgs )
import Control.Exception ( catch, ErrorCall, evaluate )
import System.IO ( stderr, hPutStr )
import Data.Maybe ( isJust, isNothing, fromJust )
import Data.List ( transpose, sort )

data CSV = CSV String [[String]] deriving Show
type Column = (String, [[String]], Int)
type LetVar = (String, [String])
type Environment = ([Column], [LetVar], [[String]], [Int])

-- depending on current node, executes required command
run :: Program -> Environment -> IO Environment
run (TProgram selects mainBody) (cs, ls, os, is) = do vars@(css, lss, oss, iss) <- run selects (cs, ls, os, is)
                                                      let dupCol = colsContainDupNames css []
                                                      if isJust dupCol then do let (name, dat, tableIndex) = fromJust dupCol 
                                                                               error ("Duplicate column name \"" ++ name ++ "\"")
                                                      else do let colLengths = getColLengths css []
                                                              if 0 `elem` colLengths then return ([], [], [], is)
                                                              else runMainBody mainBody colLengths vars
run (TSelects select selects) (cs, ls, os, is) = do (css, _, _, iss) <- run select (cs, ls, os, is)
                                                    (mcss, _, _, miss) <- run selects (css, ls, os, iss)
                                                    return (css ++ mcss, ls, os, miss)
run (TSelect (TTableName tblName) cols) (cs, ls, os, is) = do csv <- loadCSV tblName
                                                              let iss = is ++ [0]
                                                              let columns = selectColumns csv (length iss - 1) cols
                                                              return (columns, ls, os, iss)
run (TMain lets lower) (cs, ls, os, is) = do (_, lss, _, _) <- run lets (cs, ls, os, is)
                                             run lower (cs, ls ++ lss, os, is)
run (TLets letStmt moreLets) (cs, ls, os, is) = do (_, lss, _, _) <- run letStmt (cs, ls, os, is)
                                                   (_, mlss, _, _) <- run moreLets (cs, ls, os, is)
                                                   let dupLet = letsContainDupNames (lss ++ mlss) []
                                                   if isJust dupLet then do let (name, dat) = fromJust dupLet 
                                                                            error ("Duplicate variable name \"" ++ name ++ "\"")
                                                   else return (cs, lss ++ mlss, os, is)
run (TLet (TVar var1) (TAssignment ass)) (cs, ls, os, is) = do let asss = getAssignment ass cs ls is
                                                               if any (\(n, d) -> n == var1) ls || any (\(n, d, i) -> n == var1) cs then do error ("Duplicate variable name \"" ++ var1 ++ "\"") 
                                                               else if isNothing asss then do error ("Variable " ++ getName ass ++ " does not exist") 
                                                               else return (cs, ls ++ [(var1, fromJust asss)], os, is)                   
run (TLet (TVar var1) con@(TConcatenation _ _)) (cs, ls, os, is) = do if any (\(n, d) -> n == var1) ls || any (\(n, d, i) -> n == var1) cs then do error ("Duplicate variable name \"" ++ var1 ++ "\"") 
                                                                      else do let concatt = concatenate con cs ls is
                                                                              return (cs, ls ++ [(var1, [concatt])], os, is)
run (TLet1Line (TVar var) bStmt (TAssignment asst) (TAssignment assf)) (cs, ls, os, is) = do let assst = getAssignment asst cs ls is
                                                                                             let asssf = getAssignment assf cs ls is
                                                                                             if any (\(n, d) -> n == var) ls || any (\(n, d, i) -> n == var) cs then do error ("Duplicate variable name \"" ++ var ++ "\"") 
                                                                                             else if isNothing assst then do error ("Variable " ++ getName asst ++ " does not exist") 
                                                                                             else if isNothing asssf then do error ("Variable " ++ getName assf ++ " does not exist") 
                                                                                             else if evaluateBoolTest bStmt cs ls is then return (cs, ls ++ [(var, fromJust assst)], os, is)
                                                                                             else return (cs, ls ++ [(var, fromJust asssf)], os, is)
run (TMainNotLet lower) (cs, ls, os, is) = do run lower (cs, ls, os, is)
run (TIfElse i@(TIf bStmt mbt) mbf) (cs, ls, os, is) = do let res = evaluateBoolTest bStmt cs ls is
                                                          if res then run mbt (cs, ls, os, is)
                                                          else run mbf (cs, ls, os, is) 
run (TOutputs (TAssignment ass) moreOutputs) (cs, ls, os, is) = do let asss = getAssignment ass cs ls is
                                                                   if isNothing asss then do error ("Variable " ++ getName ass ++ " does not exist") 
                                                                   else do let newOS = writeToOutput os (fromJust asss)
                                                                           run moreOutputs (cs, ls, newOS, is)
run (TOutput (TAssignment ass)) (cs, ls, os, is) = do let asss = getAssignment ass cs ls is
                                                      if isNothing asss then do error ("Variable " ++ getName ass ++ " does not exist") 
                                                      else do let newOS = finishRowOutput (writeToOutput os (fromJust asss))
                                                              return (cs, ls, newOS, is)                                 
run TNoOutput (_, _, os, is) = return ([], [], os, is)    

-- Checks if the columns contain duplicates of a name
colsContainDupNames :: [Column] -> [String] -> Maybe Column
colsContainDupNames [] _ = Nothing
colsContainDupNames (c@(n, d, i):cs) acc = if n `elem` acc then Just c else colsContainDupNames cs (acc ++ [n])

-- Checks if the let variables contain duplicates of a name
letsContainDupNames :: [LetVar] -> [String] -> Maybe LetVar
letsContainDupNames [] _ = Nothing
letsContainDupNames (l@(n, d):ls) acc = if n `elem` acc then Just l else letsContainDupNames ls (acc ++ [n])

-- runs the main program the required amount of times to evaluate every row
runMainBody :: Program -> [Int] -> Environment -> IO Environment
runMainBody mainBody colLengths vars@(cs, [], os, is) = do (_, _, oss, _) <- run mainBody vars
                                                           let iss = addOne is colLengths 0
                                                           if head iss == -1 then return (cs, [], oss, iss) 
                                                           else runMainBody mainBody colLengths (cs, [], oss, iss)

-- Will concatenate a mix of strings and variables into one string
concatenate :: Program -> [Column] -> [LetVar] -> [Int] -> String
concatenate (TVar var) cs ls is = let varr = lookup' var cs ls is
                                  in if isNothing varr then do error ("Variable " ++ var ++ " does not exist")           
                                     else head (fromJust varr)
concatenate (TString str) _ _ _ = removeQuotations str 
concatenate (TConcatenation var rest) cs ls is = concatenate var cs ls is  ++ concatenate rest cs ls is 

-- takes in the indexes of the rows being worked on and adds 1, returns -1 once complete
addOne :: [Int] -> [Int] -> Int -> [Int]
addOne is colLengths index | index >= length is = [-1]
addOne is colLengths index | otherwise =  if is !! index == (colLengths !! index) - 1 then addOne (take index is ++ [0] ++ drop (index + 1) is) colLengths (index + 1) else (take index is ++ [(is !! index) + 1] ++ drop (index + 1) is) 

-- returns the length of the table columns
getColLengths :: [Column] -> [Int] -> [Int]
getColLengths [] _ = []
getColLengths ((n, d, i):cs) done = if length d == 0 then 0 : getColLengths cs done else if i `notElem` done then length (head d) : getColLengths cs (done ++ [i]) else getColLengths cs done

-- returns the name of a variable/text of a string
getName :: Program -> String
getName (TString str) = removeQuotations str
getName (TVar var) = var

-- returns the value of a string/variable or returns nothing if the variable doesn't exist
getAssignment :: Program -> [Column] -> [LetVar] -> [Int] -> Maybe [String]
getAssignment (TString str) _ _ _ = Just [removeQuotations str]
getAssignment (TVar var) cs ls is = lookup' var cs ls is

-- removes quotations from a string
removeQuotations :: String -> String
removeQuotations [] = [] 
removeQuotations (c:cs) = if c == '\"' then removeQuotations cs else c : removeQuotations cs

-- takes the 1st element of a 3 tuple
first :: (a, b, c) -> a
first (x, _, _) = x

-- evaluates the boolean condition
evaluateBoolTest :: Program -> [Column] -> [LetVar] -> [Int] -> Bool 
evaluateBoolTest (TEqual (TVar var1) (TAssignment var2)) cs ls is = let varr1 = lookup' var1 cs ls is
                                                                        varr2 = getAssignment var2 cs ls is
                                                                    in  if isNothing varr1 then do error ("Variable " ++ var1 ++ " does not exist")           
                                                                        else if isNothing varr2 then do error ("Variable " ++ getName var2 ++ " does not exist")           
                                                                        else fromJust varr1 == fromJust varr2
evaluateBoolTest (TNotEqual (TVar var1) (TAssignment var2)) cs ls is = let varr1 = lookup' var1 cs ls is
                                                                           varr2 = getAssignment var2 cs ls is
                                                                in  if isNothing varr1 then do error ("Variable " ++ var1 ++ " does not exist")           
                                                                    else if isNothing varr2 then do error ("Variable " ++ getName var2 ++ " does not exist")           
                                                                    else fromJust varr1 /= fromJust varr2      
evaluateBoolTest (TEmpty (TVar var)) cs ls is = let varr = lookup' var cs ls is
                                                in  if isNothing varr then do error ("Variable " ++ var ++ " does not exist in if statement")           
                                                    else all (== "") (fromJust varr) 
evaluateBoolTest (TNotEmpty (TVar var)) cs ls is = let varr = lookup' var cs ls is
                                                   in  if isNothing varr then do error ("Variable " ++ var ++ " does not exist in if statement")           
                                                       else any (/= "") (fromJust varr)
evaluateBoolTest (TLess (TVar var1) (TAssignment var2)) cs ls is = let varr1 = lookup' var1 cs ls is
                                                                       varr2 = getAssignment var2 cs ls is
                                                                   in  if isNothing varr1 then do error ("Variable " ++ var1 ++ " does not exist")           
                                                                       else if isNothing varr2 then do error ("Variable " ++ getName var2 ++ " does not exist")           
                                                                       else fromJust varr1 < fromJust varr2   
evaluateBoolTest (TGreater (TVar var1) (TAssignment var2)) cs ls is = let varr1 = lookup' var1 cs ls is
                                                                          varr2 = getAssignment var2 cs ls is
                                                                      in  if isNothing varr1 then do error ("Variable " ++ var1 ++ " does not exist")           
                                                                          else if isNothing varr2 then do error ("Variable " ++ getName var2 ++ " does not exist")           
                                                                          else fromJust varr1 > fromJust varr2                                                     

-- writes a new line into the output
writeToOutput :: [[String]] -> [String] -> [[String]]
writeToOutput os vars = let currentRow = os !! (length os - 1)
                            restOfList = take (length os - 1) os
                        in  restOfList ++ [currentRow ++ vars]

-- prepares the output to start another row
finishRowOutput :: [[String]] -> [[String]]
finishRowOutput os = os ++ [[]]

-- will lookup a variable name by checking if it's a column or a let variable
lookup' :: String -> [Column] -> [LetVar] -> [Int] -> Maybe [String]
lookup' str cs vs is = let coll = lookupColName str cs is
                           lett = lookupLetName str vs
                       in  if isJust coll then coll
                           else if isJust lett then lett
                           else Nothing

-- checks to see if a column name exists (and if so returns the value)
lookupColName :: String -> [Column] -> [Int] -> Maybe [String]
lookupColName _ [] _ = Nothing
lookupColName varName ((n, d, i):cs) columnIndex = if varName == n then Just (getDataAtIndex d (columnIndex !! i)) else lookupColName varName cs columnIndex

-- checks to see if the let variable exists (and if so returns assigned value)
lookupLetName :: String -> [LetVar] -> Maybe [String]
lookupLetName _ [] = Nothing
lookupLetName varName ((n, v):ns) = if varName == n then Just v else lookupLetName varName ns

-- returns the data at a given index
getDataAtIndex :: [[String]] -> Int -> [String]
getDataAtIndex [] _ = []
getDataAtIndex (d:ds) i = d !! i : getDataAtIndex ds i
 
 -- retrieves all the columns used for a given table
selectColumns :: CSV -> Int -> Program -> [Column]
selectColumns c index (TColumns nums (TVar colName) next) = (colName, selectColumn c nums, index) : selectColumns c index next 
selectColumns c index (TColumn nums (TVar colName)) = [(colName, selectColumn c nums, index)]

 -- retrieves the columns that a variable will use
selectColumn :: CSV -> Program -> [[String]]
selectColumn (CSV fileName cs) TStar = cs
selectColumn c@(CSV fileName cs) (TMultiCols (TInt colNum) next) = (cs !! colNum) : selectColumn c next  
selectColumn (CSV fileName cs) (TInt colNum) = [cs !! colNum]

-- loads in a CSV file and puts it into a workable form
loadCSV :: String -> IO CSV
loadCSV fn = do s <- readFile (fn ++ ".csv") 
                let ls = lines s
                let sss = map (splitAtDelim ',' [] []) ls
                let firstLength = length (head sss)
                let areSameLength = allRowsSameLength firstLength 1 (tail sss)
                if snd areSameLength then return (CSV fn (transpose sss))
                else error ("CSV file \"" ++ fn ++ "\" has variable row length at row " ++ show (fst areSameLength))

-- Checks all the rows in the CSV file have the same number of data entries
allRowsSameLength :: Int -> Int -> [[String]] -> (Int, Bool)
allRowsSameLength _ _ [] = (-1, True)
allRowsSameLength len index (r:rs) = if length r /= len then (index, False) else allRowsSameLength len (index + 1) rs 

-- seperates a string along any specified character
splitAtDelim :: Char -> String -> [String] -> [Char] -> [String]
splitAtDelim _ curr acc [] = if null curr then acc else acc ++ [curr]
splitAtDelim delim curr acc [x] = if x == ',' then acc ++ [curr] ++ [""] else acc ++ [curr ++ [x]]
splitAtDelim delim curr acc (c:cs) = if c == delim then splitAtDelim delim [] (acc ++ [curr]) cs else splitAtDelim delim (curr ++ [c]) acc cs

-- takes in a file name and runs the program
runProgram :: String -> IO ()
runProgram filename = do source <- readFile filename
                         let parseProg = parseCalc (alexScanTokens source)
                         (_, _, os, _) <- run parseProg ([], [], [[]], [])
                         printCSV (sort (take (length os - 1) os))
                         return ()

-- prints the entire CSV file to the console
printCSV :: [[String]] -> IO ()
printCSV [] = return ()
printCSV (l:ls) = do printLine l
                     printCSV ls

-- prints a row to the console
printLine :: [String] -> IO ()
printLine [w] = do putStrLn w
printLine (w:ws) = do putStr w
                      putStr ","
                      printLine ws

-- removes spaces up to the 1st char
removeSpace :: [Char] -> [Char]
removeSpace l@(x:xs) | x == ' ' = removeSpace xs
                     | otherwise = l

-- removes spaces before the 1st char and after the last char
removeSpaces :: [Char] -> [Char]
removeSpaces y = reverse(removeSpace(reverse(removeSpace(y))))

-- combines the seperated words back to the required CSV form
stringCombiner :: [String] -> [Char]
stringCombiner [] = []
stringCombiner (b:[]) = b
stringCombiner (b:bs) = b ++ "," ++ stringCombiner bs

-- removes all unrequired spaces from a parsed CSV row
processRow :: [Char] -> [Char]
processRow temp = stringCombiner (map removeSpaces (splitAtDelim ',' [] [] temp))

-- catches any errors from lexing or parsing
noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()

-- entry point to code
main :: IO ()
main = catch main' noParse

-- loads programs, then lexes and parses for execution
main' :: IO ()
main' = do (fileName : _ ) <- getArgs 
           runProgram fileName
