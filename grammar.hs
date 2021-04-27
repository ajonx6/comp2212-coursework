{-# OPTIONS_GHC -w #-}
module Grammar where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18
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
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,156) ([0,4,0,0,8,0,0,8192,0,0,0,512,0,128,0,0,0,0,0,1024,0,0,512,0,0,0,528,4,0,0,0,0,32,16,0,0,2,0,0,0,0,2048,0,0,0,1,0,512,0,0,0,2048,0,0,0,0,384,32768,0,0,0,0,8192,0,0,8192,0,0,2048,0,8,0,0,0,0,4,128,0,0,1,0,1552,0,0,8192,0,0,8192,0,0,16896,128,0,0,512,0,512,16384,0,0,0,0,0,0,0,16384,4104,0,0,64,0,0,12288,0,0,128,0,0,256,0,0,514,64,0,0,16,0,2,0,0,0,0,0,0,0,0,8,0,0,4,1024,0,256,0,0,128,0,0,0,0,0,1024,0,0,4096,0,2,0,0,0,0,0,0,0,0,0,0,0,16,0,194,0,0,0,64,0,8,0,0,16,0,0,32,1024,0,64,2048,0,1024,0,0,0,2,0,0,2048,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,256,0,0,512,0,0,2,64,0,2048,0,0,8,256,0,0,0,0,32,0,0,6,512,0,0,0,0,64,0,0,0,0,0,0,16384,0,0,32768,0,0,64,0,0,0,0,0,0,0,0,0,0,0,132,1,0,1024,0,0,4,128,0,8,256,0,16,512,0,3,256,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,2048,0,1,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","STMT","MainBody","Outputs","LetSTMTs","LetSTMT","Concatenations","Concatenationss","Assigment","IfOrIfElseSTMT","IfSTMT","BoolSTMT","Selects","Select","Columns","ColumnNumbers","from","tableName","get","int","'['","']'","','","as","var","eqArrow","if","then","else","isEmpty","notEmpty","let","'('","')'","'?'","':'","'&'","'='","'=='","'!='","outputArrow","'{'","'}'","'*'","'+'","str","%eof"]
        bit_start = st Prelude.* 49
        bit_end = (st Prelude.+ 1) Prelude.* 49
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..48]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (19) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (15) = happyGoto action_2
action_0 (16) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (19) = happyShift action_4
action_1 (15) = happyGoto action_2
action_1 (16) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (28) = happyShift action_8
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (39) = happyShift action_7
action_3 _ = happyReduce_29

action_4 (20) = happyShift action_6
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (49) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (21) = happyShift action_18
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (19) = happyShift action_4
action_7 (15) = happyGoto action_17
action_7 (16) = happyGoto action_3
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (29) = happyShift action_14
action_8 (34) = happyShift action_15
action_8 (43) = happyShift action_16
action_8 (5) = happyGoto action_9
action_8 (7) = happyGoto action_10
action_8 (8) = happyGoto action_11
action_8 (12) = happyGoto action_12
action_8 (13) = happyGoto action_13
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_1

action_10 (28) = happyShift action_29
action_10 (43) = happyShift action_30
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (39) = happyShift action_28
action_11 _ = happyReduce_9

action_12 _ = happyReduce_2

action_13 (31) = happyShift action_27
action_13 _ = happyReduce_23

action_14 (35) = happyShift action_26
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (27) = happyShift action_25
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (44) = happyShift action_24
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_30

action_18 (22) = happyShift action_21
action_18 (23) = happyShift action_22
action_18 (46) = happyShift action_23
action_18 (17) = happyGoto action_19
action_18 (18) = happyGoto action_20
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_31

action_20 (26) = happyShift action_46
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (25) = happyShift action_45
action_21 _ = happyReduce_38

action_22 (22) = happyShift action_21
action_22 (46) = happyShift action_23
action_22 (18) = happyGoto action_44
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_36

action_24 (27) = happyShift action_42
action_24 (48) = happyShift action_43
action_24 (6) = happyGoto action_40
action_24 (11) = happyGoto action_41
action_24 _ = happyReduce_8

action_25 (40) = happyShift action_39
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (27) = happyShift action_36
action_26 (32) = happyShift action_37
action_26 (33) = happyShift action_38
action_26 (14) = happyGoto action_35
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (35) = happyShift action_34
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (34) = happyShift action_15
action_28 (7) = happyGoto action_33
action_28 (8) = happyGoto action_11
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (29) = happyShift action_14
action_29 (34) = happyShift action_15
action_29 (43) = happyShift action_16
action_29 (5) = happyGoto action_32
action_29 (7) = happyGoto action_10
action_29 (8) = happyGoto action_11
action_29 (12) = happyGoto action_12
action_29 (13) = happyGoto action_13
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (44) = happyShift action_31
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (27) = happyShift action_42
action_31 (48) = happyShift action_43
action_31 (6) = happyGoto action_63
action_31 (11) = happyGoto action_41
action_31 _ = happyReduce_8

action_32 _ = happyReduce_4

action_33 _ = happyReduce_10

action_34 (29) = happyShift action_14
action_34 (34) = happyShift action_15
action_34 (43) = happyShift action_16
action_34 (5) = happyGoto action_62
action_34 (7) = happyGoto action_10
action_34 (8) = happyGoto action_11
action_34 (12) = happyGoto action_12
action_34 (13) = happyGoto action_13
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (36) = happyShift action_61
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (41) = happyShift action_59
action_36 (42) = happyShift action_60
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (35) = happyShift action_58
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (35) = happyShift action_57
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (27) = happyShift action_54
action_39 (35) = happyShift action_55
action_39 (48) = happyShift action_56
action_39 (9) = happyGoto action_52
action_39 (11) = happyGoto action_53
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (45) = happyShift action_51
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (25) = happyShift action_50
action_41 _ = happyReduce_6

action_42 _ = happyReduce_20

action_43 _ = happyReduce_21

action_44 (24) = happyShift action_49
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (22) = happyShift action_21
action_45 (46) = happyShift action_23
action_45 (18) = happyGoto action_48
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (27) = happyShift action_47
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (25) = happyShift action_76
action_47 _ = happyReduce_32

action_48 _ = happyReduce_37

action_49 (26) = happyShift action_75
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (27) = happyShift action_42
action_50 (48) = happyShift action_43
action_50 (6) = happyGoto action_74
action_50 (11) = happyGoto action_41
action_50 _ = happyReduce_8

action_51 _ = happyReduce_3

action_52 _ = happyReduce_13

action_53 _ = happyReduce_11

action_54 (47) = happyShift action_73
action_54 _ = happyReduce_20

action_55 (27) = happyShift action_36
action_55 (32) = happyShift action_37
action_55 (33) = happyShift action_38
action_55 (14) = happyGoto action_72
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (47) = happyShift action_71
action_56 _ = happyReduce_21

action_57 (27) = happyShift action_70
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (27) = happyShift action_69
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (27) = happyShift action_42
action_59 (48) = happyShift action_43
action_59 (11) = happyGoto action_68
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (27) = happyShift action_42
action_60 (48) = happyShift action_43
action_60 (11) = happyGoto action_67
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (30) = happyShift action_66
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (36) = happyShift action_65
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (45) = happyShift action_64
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_5

action_65 _ = happyReduce_22

action_66 (35) = happyShift action_86
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_26

action_68 _ = happyReduce_25

action_69 (36) = happyShift action_85
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (36) = happyShift action_84
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (27) = happyShift action_80
action_71 (48) = happyShift action_81
action_71 (10) = happyGoto action_83
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (36) = happyShift action_82
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (27) = happyShift action_80
action_73 (48) = happyShift action_81
action_73 (10) = happyGoto action_79
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_7

action_75 (27) = happyShift action_78
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (22) = happyShift action_21
action_76 (23) = happyShift action_22
action_76 (46) = happyShift action_23
action_76 (17) = happyGoto action_77
action_76 (18) = happyGoto action_20
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_34

action_78 (25) = happyShift action_91
action_78 _ = happyReduce_33

action_79 _ = happyReduce_14

action_80 (47) = happyShift action_90
action_80 _ = happyReduce_16

action_81 (47) = happyShift action_89
action_81 _ = happyReduce_17

action_82 (37) = happyShift action_88
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_15

action_84 _ = happyReduce_28

action_85 _ = happyReduce_27

action_86 (29) = happyShift action_14
action_86 (34) = happyShift action_15
action_86 (43) = happyShift action_16
action_86 (5) = happyGoto action_87
action_86 (7) = happyGoto action_10
action_86 (8) = happyGoto action_11
action_86 (12) = happyGoto action_12
action_86 (13) = happyGoto action_13
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (36) = happyShift action_96
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (27) = happyShift action_42
action_88 (48) = happyShift action_43
action_88 (11) = happyGoto action_95
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (27) = happyShift action_80
action_89 (48) = happyShift action_81
action_89 (10) = happyGoto action_94
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (27) = happyShift action_80
action_90 (48) = happyShift action_81
action_90 (10) = happyGoto action_93
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (22) = happyShift action_21
action_91 (23) = happyShift action_22
action_91 (46) = happyShift action_23
action_91 (17) = happyGoto action_92
action_91 (18) = happyGoto action_20
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_35

action_93 _ = happyReduce_18

action_94 _ = happyReduce_19

action_95 (38) = happyShift action_97
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_24

action_97 (27) = happyShift action_42
action_97 (48) = happyShift action_43
action_97 (11) = happyGoto action_98
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_12

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn4
		 (TProgram happy_var_1 happy_var_3
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn12  happy_var_1)
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
happyReduction_6 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (TOutput happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
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
happyReduction_11 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TLet (TVar happy_var_2) happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 10 8 happyReduction_12
happyReduction_12 ((HappyAbsSyn11  happy_var_10) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TLet1Line (TVar happy_var_2) happy_var_5 happy_var_8 happy_var_10
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 8 happyReduction_13
happyReduction_13 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TLet (TVar happy_var_2) happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_3  9 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn9
		 (TConcatenations (TVar happy_var_1) happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  9 happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn9
		 (TConcatenations (TString happy_var_1) happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn10
		 (TVar happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn10
		 (TString happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  10 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn10
		 (TConcatenations (TVar happy_var_1) happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  10 happyReduction_19
happyReduction_19 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn10
		 (TConcatenations (TString happy_var_1) happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  11 happyReduction_20
happyReduction_20 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn11
		 (TAssignment (TVar happy_var_1)
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn11
		 (TAssignment (TString happy_var_1)
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happyReduce 5 12 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (TIfElse happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_1  12 happyReduction_23
happyReduction_23 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happyReduce 8 13 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (TIf happy_var_3 happy_var_7
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_3  14 happyReduction_25
happyReduction_25 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn14
		 (TEqual (TVar happy_var_1) happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  14 happyReduction_26
happyReduction_26 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn14
		 (TNotEqual (TVar happy_var_1) happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 4 14 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (TEmpty (TVar happy_var_3)
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 4 14 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (TNotEmpty (TVar happy_var_3)
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_1  15 happyReduction_29
happyReduction_29 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  15 happyReduction_30
happyReduction_30 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (TSelects happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 4 16 happyReduction_31
happyReduction_31 ((HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenTableName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (TSelect (TTableName happy_var_2) happy_var_4
	) `HappyStk` happyRest

happyReduce_32 = happySpecReduce_3  17 happyReduction_32
happyReduction_32 (HappyTerminal (TokenVar happy_var_3))
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (TColumn happy_var_1 (TVar happy_var_3)
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 5 17 happyReduction_33
happyReduction_33 ((HappyTerminal (TokenVar happy_var_5)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (TColumn happy_var_2 (TVar happy_var_5)
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 5 17 happyReduction_34
happyReduction_34 ((HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (TColumns happy_var_1 (TVar happy_var_3) happy_var_5
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 7 17 happyReduction_35
happyReduction_35 ((HappyAbsSyn17  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_5)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (TColumns happy_var_2 (TVar happy_var_5) happy_var_7
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_1  18 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn18
		 (TStar
	)

happyReduce_37 = happySpecReduce_3  18 happyReduction_37
happyReduction_37 (HappyAbsSyn18  happy_var_3)
	_
	(HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn18
		 (TMultiCols (TInt happy_var_1) happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  18 happyReduction_38
happyReduction_38 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn18
		 (TInt happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 49 49 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenFrom -> cont 19;
	TokenTableName happy_dollar_dollar -> cont 20;
	TokenGet -> cont 21;
	TokenInt happy_dollar_dollar -> cont 22;
	TokenLColSelect -> cont 23;
	TokenRColSelect -> cont 24;
	TokenComma -> cont 25;
	TokenAs -> cont 26;
	TokenVar happy_dollar_dollar -> cont 27;
	TokenBodyArrow -> cont 28;
	TokenIf -> cont 29;
	TokenThen -> cont 30;
	TokenElse -> cont 31;
	TokenIsEmpty -> cont 32;
	TokenNotEmpty -> cont 33;
	TokenLet -> cont 34;
	TokenLParen -> cont 35;
	TokenRParen -> cont 36;
	TokenQuestion -> cont 37;
	TokenColon -> cont 38;
	TokenAnd -> cont 39;
	TokenEqual -> cont 40;
	TokenCompare -> cont 41;
	TokenNotEqual -> cont 42;
	TokenOutputArrow -> cont 43;
	TokenLOutput -> cont 44;
	TokenROutput -> cont 45;
	TokenStar -> cont 46;
	TokenPlus -> cont 47;
	TokenString happy_dollar_dollar -> cont 48;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 49 tk tks = happyError' (tks, explist)
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
             | TConcatenations Program Program
             | TConcatenation Program
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
