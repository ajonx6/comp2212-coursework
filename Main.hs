import Lexer
import Grammar
import System.Environment ( getArgs )
import Control.Exception ( catch, ErrorCall )
import System.IO ( stderr, hPutStr )

data CSV = CSV String [[String]] deriving Show
data RET = RETCSV CSV | RETBOOL Bool | RETUNIT () deriving Show
type Table = (String, CSV)
type Column = (String, String, Int, Int)

run :: Program -> IO ([Table], [Column])
run (TProgram selects mainBody) = do csvs <- run selects
                                     run mainBody
                                     return csvs
run (TSelects select selects) = do (tbls, cols) <- run select
                                   (mtbls, mcols) <- run selects
                                   return (tbls ++ mtbls, cols ++ mcols)
run (TSelect (TTableName tblName) cols) = do csv <- loadCSV tblName
                                             let tbl = (tblName, csv)
                                             let columns = selectColumns tblName cols
                                             return ([tbl], columns)
run TNoOutput = return ([], [])                                              
                                           

selectColumns :: String -> Program -> [Column]
selectColumns tblName (TColumns (TInt colNum) (TVar colName) cols) = (colName, tblName, colNum, 0) : selectColumns tblName cols 
selectColumns tblName (TColumn (TInt colNum) (TVar colName)) = [(colName, tblName, colNum, 0)]

evaluateIfTest :: Program -> Bool 
evaluateIfTest (TEqual (TVar var1) (TVar var2)) = True          -- [Column[index1]] == [Column[index2]] 
evaluateIfTest (TNotEqual (TVar var1) (TVar var2)) = True       -- [Column[index1]] != [Column[index2]] 
evaluateIfTest (TEmpty (TVar var)) = True                       -- [Column[index]] == ""
evaluateIfTest (TNotEmpty (TVar var)) = True                    -- [Column[index]] != ""

splitAtDelim :: Char -> String -> [String] -> [Char] -> [String]
splitAtDelim _ curr acc [] = if null curr then acc else acc ++ [curr]
splitAtDelim delim curr acc (c:cs) = if c == ' ' then splitAtDelim delim [] (acc ++ [curr]) cs else splitAtDelim delim (curr ++ [c]) acc cs

removeAllSpaces :: [Char] -> [Char] -> IO [Char]
removeAllSpaces [] acc = return acc
removeAllSpaces (c:cs) acc | c == ' ' = removeAllSpaces cs acc
                           | otherwise = removeAllSpaces cs (acc ++ [c])

loadCSV :: String -> IO CSV
loadCSV fn = do s <- readFile (fn ++ ".csv")
                let ls = lines s
                let sss = map (splitAtDelim ',' [] []) ls
                return (CSV fn sss)

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()

runProgram :: String -> IO ([Table], [Column])
runProgram filename = do source <- readFile filename
                         let parseProg = parseCalc (alexScanTokens source)
                         run parseProg

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