import Lexer
import Grammar
import System.Environment ( getArgs )
import Control.Exception ( catch, ErrorCall )
import System.IO ( stderr, hPutStr )

data CSV = CSV String [[String]] deriving Show
data RET = RETCSV CSV | RETBOOL Bool | RETUNIT () deriving Show
type Column = (String, [String], Int)
type LetVar = (String, String)

run :: Program -> ([Column], [LetVar]) -> IO ([Column], [LetVar])
run (TProgram selects mainBody) (cs, ls) = do vars <- run selects (cs, ls)
                                              run mainBody vars
                                              return vars
run (TSelects select selects) (cs, ls) = do (css, lss) <- run select (cs, ls)
                                            (mcss, mlss) <- run selects (cs, ls)
                                            return (css ++ mcss, lss ++ mlss)
run (TSelect (TTableName tblName) cols) (cs, ls) = do csv <- loadCSV tblName
                                                      -- let tbl = (tblName, csv)
                                                      let columns = selectColumns csv cols
                                                      return (columns, [])
run TNoOutput _ = return ([], [])    
run (TMainNotLet lower) (cs, ls) = do run lower (cs, ls)
run (TOutputs (TVar varName) moreOutputs) (cs, ls) = do let var = lookup' varName cs ls 
                                                        if null var then do error ("Variable " ++ varName ++ " does not exist") 
                                                        else do writeToOutput (var ++ ",")
                                                                run moreOutputs (cs, ls)
run (TOutput (TVar varName)) (cs, ls) = do let var = lookup' varName cs ls 
                                           if null var then do error ("Variable " ++ varName ++ " does not exist") 
                                           else do writeToOutput (var ++ "\n")
                                                   return (cs, ls)

lookup' :: String -> [Column] -> [LetVar] -> String
lookup' str cs vs = if not (null (lookup'' str cs)) then (lookup'' str cs)
                    else if not (null (lookup''' str vs)) then (lookup''' str vs)
                    else ""

lookup'' :: String -> [Column] -> String
lookup'' _ [] = ""
lookup'' varName ((n, d, i):cs) = if varName == n then d !! i else lookup'' varName cs

lookup''' :: String -> [LetVar] -> String
lookup''' _ [] = ""
lookup''' varName ((n, v):ns) = if varName == n then v else lookup''' varName ns

selectColumns :: CSV -> Program -> [Column]
selectColumns c@(CSV fileName cs) (TColumns (TInt colNum) (TVar colName) cols) = (colName, getColumn cs colNum [], 0) : selectColumns c cols 
selectColumns (CSV fileName cs) (TColumn (TInt colNum) (TVar colName)) = [(colName, getColumn cs colNum [], 0)]

getColumn :: [[String]] -> Int -> [String] -> [String]
getColumn [] colNum acc = acc
getColumn (row:rows) colNum acc = getColumn rows colNum (acc ++ [row !! colNum])

evaluateIfTest :: Program -> Bool 
evaluateIfTest (TEqual (TVar var1) (TVar var2)) = True          -- [Column[index1]] == [Column[index2]] 
evaluateIfTest (TNotEqual (TVar var1) (TVar var2)) = True       -- [Column[index1]] != [Column[index2]] 
evaluateIfTest (TEmpty (TVar var)) = True                       -- [Column[index]] == ""
evaluateIfTest (TNotEmpty (TVar var)) = True                    -- [Column[index]] != ""

createCSVFile :: IO ()
createCSVFile = do writeFile "output.csv" ""

writeToOutput :: String -> IO ()
writeToOutput output = do appendFile "output.csv" output

loadCSV :: String -> IO CSV
loadCSV fn = do s <- readFile (fn ++ ".csv") 
                let ls = lines s
                let sss = map (splitAtDelim ',' [] []) ls
                return (CSV fn sss)

splitAtDelim :: Char -> String -> [String] -> [Char] -> [String]
splitAtDelim _ curr acc [] = if null curr then acc else acc ++ [curr]
splitAtDelim delim curr acc (c:cs) = if c == delim then splitAtDelim delim [] (acc ++ [curr]) cs else splitAtDelim delim (curr ++ [c]) acc cs

runProgram :: String -> IO ([Column], [LetVar])
runProgram filename = do source <- readFile filename
                         createCSVFile
                         let parseProg = parseCalc (alexScanTokens source)
                         run parseProg ([], [])

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