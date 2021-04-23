{-# OPTIONS_GHC -w #-}
module Grammar where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,116) ([16384,0,0,512,0,0,8192,0,0,0,8,2048,0,0,0,0,0,4,0,2048,0,0,0,16417,0,0,0,0,32,16,0,2048,0,0,0,0,512,0,0,256,0,2048,0,0,0,256,0,0,0,128,0,0,0,0,0,2,0,8192,0,0,0,32,0,776,0,0,64,0,0,1,0,2112,16,0,0,2,1024,0,0,0,0,0,0,0,8192,2052,0,32768,0,0,32768,1,0,16,0,32768,0,0,1028,0,0,0,1,64,0,0,8,0,4096,0,0,512,0,0,0,0,0,0,0,33792,1,0,32,0,0,1,0,2048,0,0,64,0,0,16,0,0,32,0,0,1024,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,4,0,8192,0,0,256,0,0,0,0,1,0,0,0,0,0,32,0,0,0,0,0,0,16384,4104,0,0,1,0,4,0,0,256,0,0,0,0,8,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","STMT","MainBody","Outputs","LetSTMTs","LetSTMT","IfOrIfElseSTMT","IfSTMT","BoolSTMT","Selects","Select","Columns","from","tableName","get","int","'['","']'","','","as","var","eqArrow","if","then","else","isEmpty","notEmpty","let","'('","')'","'?'","':'","'&'","'='","'=='","'!='","outputArrow","'\"'","'{'","'}'","%eof"]
        bit_start = st Prelude.* 43
        bit_end = (st Prelude.+ 1) Prelude.* 43
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..42]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (15) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (12) = happyGoto action_2
action_0 (13) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (15) = happyShift action_4
action_1 (12) = happyGoto action_2
action_1 (13) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (24) = happyShift action_8
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (35) = happyShift action_7
action_3 _ = happyReduce_20

action_4 (16) = happyShift action_6
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (43) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (17) = happyShift action_18
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (15) = happyShift action_4
action_7 (12) = happyGoto action_17
action_7 (13) = happyGoto action_3
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (25) = happyShift action_14
action_8 (30) = happyShift action_15
action_8 (39) = happyShift action_16
action_8 (5) = happyGoto action_9
action_8 (7) = happyGoto action_10
action_8 (8) = happyGoto action_11
action_8 (9) = happyGoto action_12
action_8 (10) = happyGoto action_13
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_1

action_10 (24) = happyShift action_26
action_10 (39) = happyShift action_27
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (35) = happyShift action_25
action_11 _ = happyReduce_9

action_12 _ = happyReduce_2

action_13 (27) = happyShift action_24
action_13 _ = happyReduce_14

action_14 (31) = happyShift action_23
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (23) = happyShift action_22
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (41) = happyShift action_21
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_21

action_18 (18) = happyShift action_20
action_18 (14) = happyGoto action_19
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_22

action_20 (22) = happyShift action_39
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (23) = happyShift action_38
action_21 (6) = happyGoto action_37
action_21 _ = happyReduce_8

action_22 (36) = happyShift action_36
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (23) = happyShift action_33
action_23 (28) = happyShift action_34
action_23 (29) = happyShift action_35
action_23 (11) = happyGoto action_32
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (31) = happyShift action_31
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (30) = happyShift action_15
action_25 (7) = happyGoto action_30
action_25 (8) = happyGoto action_11
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (25) = happyShift action_14
action_26 (30) = happyShift action_15
action_26 (39) = happyShift action_16
action_26 (5) = happyGoto action_29
action_26 (7) = happyGoto action_10
action_26 (8) = happyGoto action_11
action_26 (9) = happyGoto action_12
action_26 (10) = happyGoto action_13
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (41) = happyShift action_28
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (23) = happyShift action_38
action_28 (6) = happyGoto action_51
action_28 _ = happyReduce_8

action_29 _ = happyReduce_4

action_30 _ = happyReduce_10

action_31 (25) = happyShift action_14
action_31 (30) = happyShift action_15
action_31 (39) = happyShift action_16
action_31 (5) = happyGoto action_50
action_31 (7) = happyGoto action_10
action_31 (8) = happyGoto action_11
action_31 (9) = happyGoto action_12
action_31 (10) = happyGoto action_13
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (32) = happyShift action_49
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (37) = happyShift action_47
action_33 (38) = happyShift action_48
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (31) = happyShift action_46
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (31) = happyShift action_45
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (23) = happyShift action_43
action_36 (31) = happyShift action_44
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (42) = happyShift action_42
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (21) = happyShift action_41
action_38 _ = happyReduce_6

action_39 (23) = happyShift action_40
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (21) = happyShift action_61
action_40 _ = happyReduce_23

action_41 (23) = happyShift action_38
action_41 (6) = happyGoto action_60
action_41 _ = happyReduce_8

action_42 _ = happyReduce_3

action_43 _ = happyReduce_11

action_44 (23) = happyShift action_33
action_44 (28) = happyShift action_34
action_44 (29) = happyShift action_35
action_44 (11) = happyGoto action_59
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (23) = happyShift action_58
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (23) = happyShift action_57
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (23) = happyShift action_56
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (23) = happyShift action_55
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (26) = happyShift action_54
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (32) = happyShift action_53
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (42) = happyShift action_52
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_5

action_53 _ = happyReduce_13

action_54 (31) = happyShift action_66
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_17

action_56 _ = happyReduce_16

action_57 (32) = happyShift action_65
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (32) = happyShift action_64
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (32) = happyShift action_63
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_7

action_61 (18) = happyShift action_20
action_61 (14) = happyGoto action_62
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_24

action_63 (33) = happyShift action_68
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_19

action_65 _ = happyReduce_18

action_66 (25) = happyShift action_14
action_66 (30) = happyShift action_15
action_66 (39) = happyShift action_16
action_66 (5) = happyGoto action_67
action_66 (7) = happyGoto action_10
action_66 (8) = happyGoto action_11
action_66 (9) = happyGoto action_12
action_66 (10) = happyGoto action_13
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (32) = happyShift action_70
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (23) = happyShift action_69
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (34) = happyShift action_71
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_15

action_71 (23) = happyShift action_72
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_12

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn4
		 (TProgram happy_var_1 happy_var_3
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn5
		 (TMainNotLet happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TMainNotLet happy_var_3
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 (TMain happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 5 5 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TMain happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn6
		 (TOutput (TVar happy_var_1)
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn6
		 (TOutputs (TVar happy_var_1) happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_0  6 happyReduction_8
happyReduction_8  =  HappyAbsSyn6
		 (TNoOutput
	)

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (TLets happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happyReduce 4 8 happyReduction_11
happyReduction_11 ((HappyTerminal (TokenVar happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TLet (TVar happy_var_2) (TVar happy_var_4)
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 10 8 happyReduction_12
happyReduction_12 ((HappyTerminal (TokenVar happy_var_10)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_8)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TLet1Line (TVar happy_var_2) happy_var_5 (TVar happy_var_8) (TVar happy_var_10)
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 5 9 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (TIfElse happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_1  9 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happyReduce 8 10 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (TIf happy_var_3 happy_var_7
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_3  11 happyReduction_16
happyReduction_16 (HappyTerminal (TokenVar happy_var_3))
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn11
		 (TEqual (TVar happy_var_1) (TVar happy_var_3)
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  11 happyReduction_17
happyReduction_17 (HappyTerminal (TokenVar happy_var_3))
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn11
		 (TNotEqual (TVar happy_var_1) (TVar happy_var_3)
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 4 11 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (TEmpty (TVar happy_var_3)
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 4 11 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (TNotEmpty (TVar happy_var_3)
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_1  12 happyReduction_20
happyReduction_20 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  12 happyReduction_21
happyReduction_21 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (TSelects happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 13 happyReduction_22
happyReduction_22 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenTableName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (TSelect (TTableName happy_var_2) happy_var_4
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  14 happyReduction_23
happyReduction_23 (HappyTerminal (TokenVar happy_var_3))
	_
	(HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn14
		 (TColumn (TInt happy_var_1) (TVar happy_var_3)
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 5 14 happyReduction_24
happyReduction_24 ((HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (TColumns (TInt happy_var_1) (TVar happy_var_3) happy_var_5
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 43 43 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenFrom -> cont 15;
	TokenTableName happy_dollar_dollar -> cont 16;
	TokenGet -> cont 17;
	TokenInt happy_dollar_dollar -> cont 18;
	TokenLColSelect -> cont 19;
	TokenRColSelect -> cont 20;
	TokenComma -> cont 21;
	TokenAs -> cont 22;
	TokenVar happy_dollar_dollar -> cont 23;
	TokenBodyArrow -> cont 24;
	TokenIf -> cont 25;
	TokenThen -> cont 26;
	TokenElse -> cont 27;
	TokenIsEmpty -> cont 28;
	TokenNotEmpty -> cont 29;
	TokenLet -> cont 30;
	TokenLParen -> cont 31;
	TokenRParen -> cont 32;
	TokenQuestion -> cont 33;
	TokenColon -> cont 34;
	TokenAnd -> cont 35;
	TokenEqual -> cont 36;
	TokenCompare -> cont 37;
	TokenNotEqual -> cont 38;
	TokenOutputArrow -> cont 39;
	TokenQuotation -> cont 40;
	TokenLOutput -> cont 41;
	TokenROutput -> cont 42;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 43 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
             | TTableName String
             deriving (Show, Eq)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
