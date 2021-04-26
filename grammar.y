{
module Grammar where
import Tokens
}

%name parseCalc
%tokentype { Token }
%error { parseError }
%token
      from        { TokenFrom }
      tableName   { TokenTableName $$ }
      get         { TokenGet }
      int         { TokenInt $$ }
      '['          { TokenLColSelect }
      ']'          { TokenRColSelect }
      ','          { TokenComma }
      as           { TokenAs }
      var          { TokenVar $$ }
      eqArrow      { TokenBodyArrow }
      if           { TokenIf }
      then         { TokenThen }
      else         { TokenElse }
      isEmpty      { TokenIsEmpty }
      notEmpty     { TokenNotEmpty }
      let          { TokenLet }
      '('          { TokenLParen }
      ')'          { TokenRParen }
      '?'          { TokenQuestion }
      ':'          { TokenColon }
      '&'          { TokenAnd }
      '='          { TokenEqual }
      '=='         { TokenCompare }
      '!='         { TokenNotEqual }
      outputArrow  { TokenOutputArrow }
      '{'          { TokenLOutput }
      '}'          { TokenROutput }
      '*'          { TokenStar }

%%
STMT : Selects eqArrow MainBody                        { TProgram $1 $3 }

MainBody : IfOrIfElseSTMT                              { TMainNotLet $1 }
         | outputArrow '{' Outputs '}'                 { TMainNotLet $3 }
         | LetSTMTs eqArrow MainBody                   { TMain $1 $3 }
         | LetSTMTs outputArrow '{' Outputs '}'        { TMain $1 $4 }

Outputs : var                                   { TOutput (TVar $1) }
        | var ',' Outputs                       { TOutputs (TVar $1) $3 }
        |                                              { TNoOutput}

LetSTMTs : LetSTMT                                     { $1 }
         | LetSTMT '&' LetSTMTs                        { TLets $1 $3 }

LetSTMT : let var '=' var                                     { TLet (TVar $2) (TVar $4) }
        | let var '=' '(' BoolSTMT ')' '?' var ':' var        { TLet1Line (TVar $2) $5 (TVar $8) (TVar $10) }

IfOrIfElseSTMT : IfSTMT else '(' MainBody ')'          { TIfElse $1 $4 } 
               | IfSTMT                                { $1 }

IfSTMT : if '(' BoolSTMT ')' then '(' MainBody ')'     { TIf $3 $7 }

BoolSTMT : var '==' var                         { TEqual (TVar $1) (TVar $3) }
         | var '!=' var                         { TNotEqual (TVar $1) (TVar $3) }
         | isEmpty '(' var ')'                         { TEmpty (TVar $3) }
         | notEmpty '(' var ')'                        { TNotEmpty (TVar $3) }


Selects : Select                                       { $1 }
        | Select '&' Selects                           { TSelects $1 $3 } 

Select : from tableName get Columns                    { TSelect (TTableName $2) $4 }

Columns : ColumnNumbers as var                            { TColumn $1 (TVar $3) }
        | '[' ColumnNumbers ']' as var                            { TColumn $2 (TVar $5) }
        | ColumnNumbers as var ',' Columns                { TColumns $1 (TVar $3) $5 }
        | '[' ColumnNumbers ']' as var ',' Columns                { TColumns $2 (TVar $5) $7 }

ColumnNumbers : '*'                                       { TStar }
              | int ',' ColumnNumbers                     { TMultiCols (TInt $1) $3 }
              | int                                       { TInt $1 }

{
parseError :: [Token] -> a
parseError _ = error "Parse Error"

data Program = TProgram Program Program
             | TMain Program Program
             | TVar String
             | TInt Int
             | TOutput Program
             | TOutputs Program Program
             | TNoOutput
             | TMainNotLet Program
             | TLets Program Program
             | TLet Program Program
             | TLet1Line Program Program Program Program 
             | TIfElse Program Program
             | TIf Program Program
             | TEqual Program Program
             | TNotEqual Program Program
             | TEmpty Program 
             | TNotEmpty Program 
             | TSelects Program Program
             | TSelect Program Program 
             | TColumn Program Program 
             | TColumns Program Program Program 
             | TMultiCols Program Program
             | TStar
             | TTableName String
             deriving (Show, Eq)
}
