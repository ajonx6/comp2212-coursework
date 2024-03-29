{ 
module Lexer where 
}

%wrapper "basic" 
$digit = 0-9     
-- digits 
$alphaLower = [a-z]
$alphaUpper = [A-Z]  
$everything = [A-Za-z0-9\ ]
-- alphabetic characters

tokens :-
  $white+       		         ; 
  "--".*        		         ; 
  $white                     ;
  from                         { \s -> TokenFrom }
  $alphaUpper+                 { \s -> TokenTableName s}
  get					    { \s -> TokenGet }
  as					    { \s -> TokenAs }
  let                          { \s -> TokenLet } 
  if                           { \s -> TokenIf }
  then                         { \s -> TokenThen }
  else                         { \s -> TokenElse }
  $digit+                      { \s -> TokenInt (read s) } 
  isEmpty				    { \s -> TokenIsEmpty }
  notEmpty                     { \s -> TokenNotEmpty }
  \?					    { \s -> TokenQuestion }
  \:					    { \s -> TokenColon }
  \&					    { \s -> TokenAnd }
  \,					    { \s -> TokenComma }
  \=>					    { \s -> TokenBodyArrow }
  \->					    { \s -> TokenOutputArrow }
  \[					    { \s -> TokenLColSelect }
  \]					    { \s -> TokenRColSelect }
  \==				           { \s -> TokenCompare }
  \=                           { \s -> TokenEqual }
  \!=                          { \s -> TokenNotEqual }
  \+          		           { \s -> TokenPlus }
  \*          		           { \s -> TokenStar }
  \{          		           { \s -> TokenLOutput }
  \}          		           { \s -> TokenROutput }
  \(          		           { \s -> TokenLParen }
  \)          		           { \s -> TokenRParen }
  \<          		           { \s -> TokenLT }
  \>          		           { \s -> TokenGT }
  \" $everything+ \"                { \s -> TokenString s }
  $alphaLower+ $digit*         { \s -> TokenVar s }
  

{ 
-- Each action has type :: String -> Token
-- The token type:
data Token = 
  TokenFrom               |
  TokenTableName String   |
  TokenGet                |
  TokenAs                 |
  TokenLet                | 
  TokenIf                 |
  TokenThen               |
  TokenElse               |
  TokenInt Int            |
  TokenAnd                |
  TokenComma              |
  TokenBodyArrow          |
  TokenOutputArrow        |
  TokenLColSelect         |
  TokenRColSelect         |
  TokenCompare            |
  TokenVar String         |
  TokenEqual              |
  TokenNotEqual           |
  TokenPlus               |
  TokenStar               |
  TokenLOutput            |
  TokenROutput            |
  TokenLParen             |
  TokenRParen             |
  TokenIsEmpty            |
  TokenNotEmpty           |
  TokenQuestion           |
  TokenString String      |
  TokenLT                 |
  TokenGT                 |
  TokenColon              
  deriving (Eq,Show)
}
