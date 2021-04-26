{-# OPTIONS_GHC -w #-}
module Grammar where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16
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
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,137) ([0,1,0,16384,0,0,0,32,0,0,16384,0,512,0,0,0,0,0,64,0,0,4,0,0,33792,256,0,0,0,0,32,16,0,16384,0,0,0,0,0,4,0,0,16,0,1024,0,0,0,512,0,0,0,32768,1,128,0,0,0,32768,0,0,4096,0,0,128,32768,0,0,0,0,256,4096,0,0,8,0,1552,0,0,1024,0,0,128,0,0,16417,0,0,8192,0,1024,16384,0,0,0,0,0,0,0,2112,16,0,2048,0,0,49152,0,0,64,0,0,16,0,1024,16388,0,0,1024,0,16,0,0,0,0,0,0,0,8192,0,0,512,0,2,4096,0,0,256,0,0,0,0,0,32,0,0,16,256,0,0,0,0,0,0,16384,24,0,4096,0,0,1024,0,0,256,4096,0,64,1024,0,128,0,0,2048,0,0,0,4,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,8192,0,0,2048,0,0,512,0,0,0,0,4096,0,0,96,8192,0,0,0,0,16,0,0,16384,0,0,0,0,0,0,0,0,16417,0,0,32,0,1024,16384,0,24,2048,0,0,0,0,32768,0,0,0,0,0,1,16,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","STMT","MainBody","Outputs","LetSTMTs","LetSTMT","Assigment","IfOrIfElseSTMT","IfSTMT","BoolSTMT","Selects","Select","Columns","ColumnNumbers","from","tableName","get","int","'['","']'","','","as","var","eqArrow","if","then","else","isEmpty","notEmpty","let","'('","')'","'?'","':'","'&'","'='","'=='","'!='","outputArrow","'{'","'}'","'*'","str","%eof"]
        bit_start = st Prelude.* 46
        bit_end = (st Prelude.+ 1) Prelude.* 46
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..45]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (17) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (13) = happyGoto action_2
action_0 (14) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (17) = happyShift action_4
action_1 (13) = happyGoto action_2
action_1 (14) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (26) = happyShift action_8
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (37) = happyShift action_7
action_3 _ = happyReduce_22

action_4 (18) = happyShift action_6
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (46) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (19) = happyShift action_18
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (17) = happyShift action_4
action_7 (13) = happyGoto action_17
action_7 (14) = happyGoto action_3
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (27) = happyShift action_14
action_8 (32) = happyShift action_15
action_8 (41) = happyShift action_16
action_8 (5) = happyGoto action_9
action_8 (7) = happyGoto action_10
action_8 (8) = happyGoto action_11
action_8 (10) = happyGoto action_12
action_8 (11) = happyGoto action_13
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_1

action_10 (26) = happyShift action_29
action_10 (41) = happyShift action_30
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (37) = happyShift action_28
action_11 _ = happyReduce_9

action_12 _ = happyReduce_2

action_13 (29) = happyShift action_27
action_13 _ = happyReduce_16

action_14 (33) = happyShift action_26
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (25) = happyShift action_25
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (42) = happyShift action_24
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_23

action_18 (20) = happyShift action_21
action_18 (21) = happyShift action_22
action_18 (44) = happyShift action_23
action_18 (15) = happyGoto action_19
action_18 (16) = happyGoto action_20
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_24

action_20 (24) = happyShift action_46
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (23) = happyShift action_45
action_21 _ = happyReduce_31

action_22 (20) = happyShift action_21
action_22 (44) = happyShift action_23
action_22 (16) = happyGoto action_44
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_29

action_24 (25) = happyShift action_42
action_24 (45) = happyShift action_43
action_24 (6) = happyGoto action_40
action_24 (9) = happyGoto action_41
action_24 _ = happyReduce_8

action_25 (38) = happyShift action_39
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (25) = happyShift action_36
action_26 (30) = happyShift action_37
action_26 (31) = happyShift action_38
action_26 (12) = happyGoto action_35
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (33) = happyShift action_34
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (32) = happyShift action_15
action_28 (7) = happyGoto action_33
action_28 (8) = happyGoto action_11
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (27) = happyShift action_14
action_29 (32) = happyShift action_15
action_29 (41) = happyShift action_16
action_29 (5) = happyGoto action_32
action_29 (7) = happyGoto action_10
action_29 (8) = happyGoto action_11
action_29 (10) = happyGoto action_12
action_29 (11) = happyGoto action_13
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (42) = happyShift action_31
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (25) = happyShift action_42
action_31 (45) = happyShift action_43
action_31 (6) = happyGoto action_60
action_31 (9) = happyGoto action_41
action_31 _ = happyReduce_8

action_32 _ = happyReduce_4

action_33 _ = happyReduce_10

action_34 (27) = happyShift action_14
action_34 (32) = happyShift action_15
action_34 (41) = happyShift action_16
action_34 (5) = happyGoto action_59
action_34 (7) = happyGoto action_10
action_34 (8) = happyGoto action_11
action_34 (10) = happyGoto action_12
action_34 (11) = happyGoto action_13
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (34) = happyShift action_58
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (39) = happyShift action_56
action_36 (40) = happyShift action_57
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (33) = happyShift action_55
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (33) = happyShift action_54
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (25) = happyShift action_42
action_39 (33) = happyShift action_53
action_39 (45) = happyShift action_43
action_39 (9) = happyGoto action_52
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (43) = happyShift action_51
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (23) = happyShift action_50
action_41 _ = happyReduce_6

action_42 _ = happyReduce_13

action_43 _ = happyReduce_14

action_44 (22) = happyShift action_49
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (20) = happyShift action_21
action_45 (44) = happyShift action_23
action_45 (16) = happyGoto action_48
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (25) = happyShift action_47
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (23) = happyShift action_71
action_47 _ = happyReduce_25

action_48 _ = happyReduce_30

action_49 (24) = happyShift action_70
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (25) = happyShift action_42
action_50 (45) = happyShift action_43
action_50 (6) = happyGoto action_69
action_50 (9) = happyGoto action_41
action_50 _ = happyReduce_8

action_51 _ = happyReduce_3

action_52 _ = happyReduce_11

action_53 (25) = happyShift action_36
action_53 (30) = happyShift action_37
action_53 (31) = happyShift action_38
action_53 (12) = happyGoto action_68
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (25) = happyShift action_67
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (25) = happyShift action_66
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (25) = happyShift action_42
action_56 (45) = happyShift action_43
action_56 (9) = happyGoto action_65
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (25) = happyShift action_42
action_57 (45) = happyShift action_43
action_57 (9) = happyGoto action_64
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (28) = happyShift action_63
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (34) = happyShift action_62
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (43) = happyShift action_61
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_5

action_62 _ = happyReduce_15

action_63 (33) = happyShift action_77
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_19

action_65 _ = happyReduce_18

action_66 (34) = happyShift action_76
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (34) = happyShift action_75
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (34) = happyShift action_74
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_7

action_70 (25) = happyShift action_73
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (20) = happyShift action_21
action_71 (21) = happyShift action_22
action_71 (44) = happyShift action_23
action_71 (15) = happyGoto action_72
action_71 (16) = happyGoto action_20
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_27

action_73 (23) = happyShift action_80
action_73 _ = happyReduce_26

action_74 (35) = happyShift action_79
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_21

action_76 _ = happyReduce_20

action_77 (27) = happyShift action_14
action_77 (32) = happyShift action_15
action_77 (41) = happyShift action_16
action_77 (5) = happyGoto action_78
action_77 (7) = happyGoto action_10
action_77 (8) = happyGoto action_11
action_77 (10) = happyGoto action_12
action_77 (11) = happyGoto action_13
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (34) = happyShift action_83
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (25) = happyShift action_42
action_79 (45) = happyShift action_43
action_79 (9) = happyGoto action_82
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (20) = happyShift action_21
action_80 (21) = happyShift action_22
action_80 (44) = happyShift action_23
action_80 (15) = happyGoto action_81
action_80 (16) = happyGoto action_20
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_28

action_82 (36) = happyShift action_84
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_17

action_84 (25) = happyShift action_42
action_84 (45) = happyShift action_43
action_84 (9) = happyGoto action_85
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_12

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn4
		 (TProgram happy_var_1 happy_var_3
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn10  happy_var_1)
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
happyReduction_6 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (TOutput happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (TOutputs happy_var_1 happy_var_3
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
happyReduction_11 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TLet (TVar happy_var_2) happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 10 8 happyReduction_12
happyReduction_12 ((HappyAbsSyn9  happy_var_10) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TLet1Line (TVar happy_var_2) happy_var_5 happy_var_8 happy_var_10
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn9
		 (TAssignment (TVar happy_var_1)
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  9 happyReduction_14
happyReduction_14 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn9
		 (TAssignment (TString happy_var_1)
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happyReduce 5 10 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (TIfElse happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happyReduce 8 11 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (TIf happy_var_3 happy_var_7
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_3  12 happyReduction_18
happyReduction_18 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn12
		 (TEqual (TVar happy_var_1) happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn12
		 (TNotEqual (TVar happy_var_1) happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 4 12 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (TEmpty (TVar happy_var_3)
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 12 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (TNotEmpty (TVar happy_var_3)
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_1  13 happyReduction_22
happyReduction_22 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  13 happyReduction_23
happyReduction_23 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (TSelects happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 4 14 happyReduction_24
happyReduction_24 ((HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenTableName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (TSelect (TTableName happy_var_2) happy_var_4
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_3  15 happyReduction_25
happyReduction_25 (HappyTerminal (TokenVar happy_var_3))
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (TColumn happy_var_1 (TVar happy_var_3)
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happyReduce 5 15 happyReduction_26
happyReduction_26 ((HappyTerminal (TokenVar happy_var_5)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (TColumn happy_var_2 (TVar happy_var_5)
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 5 15 happyReduction_27
happyReduction_27 ((HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (TColumns happy_var_1 (TVar happy_var_3) happy_var_5
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 7 15 happyReduction_28
happyReduction_28 ((HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_5)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (TColumns happy_var_2 (TVar happy_var_5) happy_var_7
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_1  16 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn16
		 (TStar
	)

happyReduce_30 = happySpecReduce_3  16 happyReduction_30
happyReduction_30 (HappyAbsSyn16  happy_var_3)
	_
	(HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn16
		 (TMultiCols (TInt happy_var_1) happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  16 happyReduction_31
happyReduction_31 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn16
		 (TInt happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 46 46 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenFrom -> cont 17;
	TokenTableName happy_dollar_dollar -> cont 18;
	TokenGet -> cont 19;
	TokenInt happy_dollar_dollar -> cont 20;
	TokenLColSelect -> cont 21;
	TokenRColSelect -> cont 22;
	TokenComma -> cont 23;
	TokenAs -> cont 24;
	TokenVar happy_dollar_dollar -> cont 25;
	TokenBodyArrow -> cont 26;
	TokenIf -> cont 27;
	TokenThen -> cont 28;
	TokenElse -> cont 29;
	TokenIsEmpty -> cont 30;
	TokenNotEmpty -> cont 31;
	TokenLet -> cont 32;
	TokenLParen -> cont 33;
	TokenRParen -> cont 34;
	TokenQuestion -> cont 35;
	TokenColon -> cont 36;
	TokenAnd -> cont 37;
	TokenEqual -> cont 38;
	TokenCompare -> cont 39;
	TokenNotEqual -> cont 40;
	TokenOutputArrow -> cont 41;
	TokenLOutput -> cont 42;
	TokenROutput -> cont 43;
	TokenStar -> cont 44;
	TokenString happy_dollar_dollar -> cont 45;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 46 tk tks = happyError' (tks, explist)
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
             | TString String
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
             | TAssignment Program
             | TStar
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
