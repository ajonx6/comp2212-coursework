import Lexer
import Grammar
import System.Environment
import Control.Exception
import System.IO ( stderr, hPutStr )

main :: IO ()
main = catch main' noParse

main' = do (fileName : _ ) <- getArgs 
           sourceText <- readFile fileName
           putStrLn ("Lexing : " ++ sourceText)
           let parsedProg = parseCalc (alexScanTokens sourceText)
           -- putStrLn ("Lexed as " ++ (show (alexScanTokens sourceText)))
           putStrLn ("Parsed as " ++ (show parsedProg))

splitAtSpaces :: [Char] -> String -> [String] -> [String]
splitAtSpaces [] curr acc = if null curr then acc else acc ++ [curr]
splitAtSpaces (c:cs) curr acc = if c == ' ' then splitAtSpaces cs [] (acc ++ [curr]) else splitAtSpaces cs (curr ++ [c]) acc

loadCSV :: [Char] -> IO [[String]]
loadCSV fn = do s <- readFile (fn ++ ".csv")
                let ls = lines s
                let sss = map words ls
                return sss

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()