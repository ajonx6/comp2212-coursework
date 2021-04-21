{ 
module ToyTokens where 
}

%wrapper "posn" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
$white+       ; 
  "--".*        ; 
  Bool           { \p s -> TokenTypeBool p } 
  Int            { \p s -> TokenTypeInt p }
  "->"           { \p s -> TokenTypeArr p }
  $digit+        { \p s -> TokenInt p (read s) }
  true           { \p s -> TokenTrue p }
  false          { \p s -> TokenFalse p }
  \<             { \p s -> TokenLessThan p }
  \+             { \p s -> TokenPlus p }
  if             { \p s -> TokenIf p }
  then           { \p s -> TokenThen p }
  else           { \p s -> TokenElse p }
  \\             { \p s -> TokenLambda p }
  \:             { \p s -> TokenHasType p }
  let            { \p s -> TokenLet p }
  =              { \p s -> TokenEq p }
  in             { \p s -> TokenIn p }
  \(             { \p s -> TokenLParen p }
  \)             { \p s -> TokenRParen p }
  $alpha [$alpha $digit \_ \’]*   { \p s -> TokenVar p s } 

{ 
-- Each action has type :: AlexPosn -> String -> ToyToken 

-- The token type: 
data ToyToken = 
  TokenTypeBool AlexPosn         | 
  TokenTypeInt  AlexPosn         | 
  TokenTypeArr  AlexPosn         |
  TokenInt AlexPosn Int          | 
  TokenTrue AlexPosn             |
  TokenFalse AlexPosn            |
  TokenLessThan AlexPosn         |
  TokenPlus AlexPosn             |
  TokenIf AlexPosn               |
  TokenThen AlexPosn             |
  TokenElse AlexPosn             |
  TokenLambda AlexPosn           |
  TokenHasType AlexPosn          |
  TokenLet AlexPosn              |
  TokenEq AlexPosn               |
  TokenIn AlexPosn               |
  TokenLParen AlexPosn           |
  TokenRParen AlexPosn           |
  TokenVar AlexPosn String
  deriving (Eq,Show) 

tokenPosn :: ToyToken -> String
tokenPosn (TokenTypeBool (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeInt  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeArr  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInt  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTrue  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessThan  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPlus  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenThen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLambda (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenHasType (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLet (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEq  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIn  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenVar (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)

}