import Lexer
import Grammar
import System.Environment ( getArgs )
import Control.Exception ( catch, ErrorCall, evaluate )
import System.IO ( stderr, hPutStr )
import Data.Maybe ( isJust, isNothing, fromJust )

data CSV = CSV String [[String]] deriving Show
type Column = (String, [String], Int)
type LetVar = (String, String)
type Environment = ([Column], [LetVar], [[String]])

run :: Program -> Environment -> IO Environment
run (TProgram selects mainBody) (cs, ls, os) = do vars <- run selects (cs, ls, os)
                                                  run mainBody vars
run (TSelects select selects) (cs, ls, os) = do (css, _, _) <- run select (cs, ls, os)
                                                (mcss, _, _) <- run selects (cs, ls, os)
                                                return (css ++ mcss, ls, os)
run (TSelect (TTableName tblName) cols) (cs, ls, os) = do csv <- loadCSV tblName
                                                          let columns = selectColumns csv cols
                                                          return (columns, ls, os)
run (TMain lets lower) (cs, ls, os) = do (_, lss, _) <- run lets (cs, ls, os)
                                         run lower (cs, ls ++ lss, os)
run (TLets letStmt moreLets) (cs, ls, os) = do (_, lss, _) <- run letStmt (cs, ls, os)
                                               (_, mlss, _) <- run moreLets (cs, ls, os)
                                               return (cs, lss ++ mlss, os)
run (TLet (TVar var1) (TVar var2)) (cs, ls, os) = do let v1 = doesVarExist var1 cs ls
                                                     let v2 = doesVarExist var2 cs ls
                                                     if not v1 then error ("Variable " ++ var1 ++ " does not exist")
                                                     else if not v2 then error ("Variable " ++ var2 ++ " does not exist")
                                                     else return (cs, ls ++ [(var1, fromJust (lookup' var2 cs ls))], os)                   
run (TLet1Line (TVar var) bStmt (TVar vart) (TVar varf)) (cs, ls, os) = do let vt = doesVarExist vart cs ls
                                                                           let vf = doesVarExist varf cs ls
                                                                           if not vt then error ("Variable " ++ vart ++ " does not exist")
                                                                           else if not vf then error ("Variable " ++ varf ++ " does not exist")
                                                                           else if evaluateBoolTest bStmt cs ls then return (cs, ls ++ [(var, fromJust (lookup' vart cs ls))], os)
                                                                           else return (cs, ls ++ [(var, fromJust (lookup' varf cs ls))], os)
run (TMainNotLet lower) (cs, ls, os) = do run lower (cs, ls, os)
run (TIfElse (TIf bStmt mbt) mbf) (cs, ls, os) = do let res = evaluateBoolTest bStmt cs ls
                                                    if res then run mbt (cs, ls, os)
                                                    else run mbf (cs, ls, os) 
run (TOutputs (TVar varName) moreOutputs) (cs, ls, os) = do let var = lookup' varName cs ls
                                                            if isNothing var then do error ("Variable " ++ varName ++ " does not exist") 
                                                            else do let newOS = writeToOutput os (fromJust var)
                                                                    run moreOutputs (cs, ls, newOS)
run (TOutput (TVar varName)) (cs, ls, os) = do let var = lookup' varName cs ls
                                               if isNothing var then do error ("Variable " ++ varName ++ " does not exist") 
                                               else do let newOS = finishRowOutput (writeToOutput os (fromJust var))
                                                       return (cs, ls, newOS)
run TNoOutput (_, _, os) = return ([], [], os)    

doesVarExist :: String -> [Column] -> [LetVar] -> Bool
doesVarExist s cs ls = s `elem` (map first cs) || s `elem` (map fst ls)

first :: (a, b, c) -> a
first (x, _, _) = x

evaluateBoolTest :: Program -> [Column] -> [LetVar] -> Bool 
evaluateBoolTest (TEqual (TVar var1) (TVar var2)) cs ls = let varr1 = lookup' var1 cs ls
                                                              varr2 = lookup' var2 cs ls
                                                          in  if isNothing varr1 then do error ("Variable " ++ var1 ++ " does not exist")           
                                                              else if isNothing varr2 then do error ("Variable " ++ var2 ++ " does not exist")           
                                                              else fromJust varr1 == fromJust varr2
evaluateBoolTest (TNotEqual (TVar var1) (TVar var2)) cs ls = let varr1 = lookup' var1 cs ls
                                                                 varr2 = lookup' var2 cs ls
                                                             in  if isNothing varr1 then do error ("Variable " ++ var1 ++ " does not exist")           
                                                                 else if isNothing varr2 then do error ("Variable " ++ var2 ++ " does not exist")           
                                                                 else fromJust varr1 /= fromJust varr2      
evaluateBoolTest (TEmpty (TVar var)) cs ls = let varr = lookup' var cs ls
                                             in  if isNothing varr then do error ("Variable " ++ var ++ " does not exist in if statement")           
                                                 else fromJust varr == "" 
evaluateBoolTest (TNotEmpty (TVar var)) cs ls = let varr = lookup' var cs ls
                                                in  if isNothing varr then do error ("Variable " ++ var ++ " does not exist in if statement")           
                                                    else fromJust varr /= ""

writeToOutput :: [[String]] -> String -> [[String]]
writeToOutput os var = let currentRow = os !! (length os - 1)
                           restOfList = take (length os - 1) os
                       in  restOfList ++ [currentRow ++ [var]]

finishRowOutput :: [[String]] -> [[String]]
finishRowOutput os = os ++ [[]]

lookup' :: String -> [Column] -> [LetVar] -> Maybe String
lookup' str cs vs = let coll = lookupColName str cs
                        lett = lookupLetName str vs
                    in  if isJust coll then coll
                        else if isJust lett then lett
                        else Nothing

lookupColName :: String -> [Column] -> Maybe String
lookupColName _ [] = Nothing
lookupColName varName ((n, d, i):cs) = if varName == n then Just (d !! i) else lookupColName varName cs

lookupLetName :: String -> [LetVar] -> Maybe String
lookupLetName _ [] = Nothing
lookupLetName varName ((n, v):ns) = if varName == n then Just v else lookupLetName varName ns

selectColumns :: CSV -> Program -> [Column]
selectColumns c@(CSV fileName cs) (TColumns (TInt colNum) (TVar colName) cols) = (colName, getColumn cs colNum [], 0) : selectColumns c cols 
selectColumns (CSV fileName cs) (TColumn (TInt colNum) (TVar colName)) = [(colName, getColumn cs colNum [], 0)]

getColumn :: [[String]] -> Int -> [String] -> [String]
getColumn [] colNum acc = acc
getColumn (row:rows) colNum acc = getColumn rows colNum (acc ++ [row !! colNum])

loadCSV :: String -> IO CSV
loadCSV fn = do s <- readFile (fn ++ ".csv") 
                let ls = lines s
                let sss = map (splitAtDelim ',' [] []) ls
                return (CSV fn sss)

splitAtDelim :: Char -> String -> [String] -> [Char] -> [String]
splitAtDelim _ curr acc [] = if null curr then acc else acc ++ [curr]
splitAtDelim delim curr acc [x] = if x == ',' then acc ++ [curr] ++ [""] else acc ++ [curr ++ [x]]
splitAtDelim delim curr acc (c:cs) = if c == delim then splitAtDelim delim [] (acc ++ [curr]) cs else splitAtDelim delim (curr ++ [c]) acc cs

runProgram :: String -> IO ()
runProgram filename = do source <- readFile filename
                         let parseProg = parseCalc (alexScanTokens source)
                         (_, _, os) <- run parseProg ([], [], [[]])
                         print (take (length os - 1) os)
                         return ()

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()

main :: IO ()
main = catch main' noParse

main' :: IO ()
main' = do (fileName : _ ) <- getArgs 
           sourceText <- readFile fileName
           -- withoutSpaces <- removeAllSpaces sourceText []
           putStrLn ("Lexing : " ++ sourceText)
           let parsedProg = parseCalc (alexScanTokens sourceText)
           putStrLn ("Lexed as " ++ (show (alexScanTokens sourceText)))
           putStrLn ("Parsed as " ++ (show parsedProg))