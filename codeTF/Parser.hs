{-# OPTIONS_GHC -w #-}
module Parser where

import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,260) ([32,22992,4098,0,0,0,0,64512,16383,75,2,9629,0,0,0,0,0,64,45984,4,0,0,0,1024,2048,29696,150,0,256,0,0,16,65535,5839,0,0,49280,65535,1207,0,0,0,0,0,8,38516,1024,14848,75,2,9629,256,52864,32786,16384,2407,64,45984,8196,53248,601,16,11496,2049,29696,150,4,19258,512,40192,37,32769,4814,128,26432,16393,40960,1203,32,22992,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,22992,2,0,3104,0,0,1024,14848,75,65534,26015,0,0,1,0,24832,0,0,0,0,0,65520,12031,2049,29696,150,0,1024,512,40192,37,32769,4814,0,0,0,0,0,0,16384,24,0,0,0,8192,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Exp","Type","num","'+'","'*'","'-'","\"&&\"","\"||\"","\"-&&\"","\"-||\"","\"-&|\"","\"==\"","\"/=\"","\">\"","\">=\"","\"<\"","\"<=\"","\"***\"","\"**\"","true","false","if","then","else","var","'\\\\'","\"->\"","'('","')'","'='","let","in","Bool","Num","':'","%eof"]
        bit_start = st * 39
        bit_end = (st + 1) * 39
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..38]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (6) = happyShift action_2
action_0 (21) = happyShift action_4
action_0 (23) = happyShift action_5
action_0 (24) = happyShift action_6
action_0 (25) = happyShift action_7
action_0 (28) = happyShift action_8
action_0 (29) = happyShift action_9
action_0 (31) = happyShift action_10
action_0 (34) = happyShift action_11
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (6) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (6) = happyShift action_2
action_3 (7) = happyShift action_18
action_3 (8) = happyShift action_19
action_3 (9) = happyShift action_20
action_3 (10) = happyShift action_21
action_3 (11) = happyShift action_22
action_3 (12) = happyShift action_23
action_3 (13) = happyShift action_24
action_3 (14) = happyShift action_25
action_3 (15) = happyShift action_26
action_3 (16) = happyShift action_27
action_3 (17) = happyShift action_28
action_3 (18) = happyShift action_29
action_3 (19) = happyShift action_30
action_3 (20) = happyShift action_31
action_3 (21) = happyShift action_4
action_3 (22) = happyShift action_32
action_3 (23) = happyShift action_5
action_3 (24) = happyShift action_6
action_3 (25) = happyShift action_7
action_3 (28) = happyShift action_8
action_3 (29) = happyShift action_9
action_3 (31) = happyShift action_10
action_3 (34) = happyShift action_11
action_3 (39) = happyAccept
action_3 (4) = happyGoto action_17
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (6) = happyShift action_2
action_4 (21) = happyShift action_4
action_4 (23) = happyShift action_5
action_4 (24) = happyShift action_6
action_4 (25) = happyShift action_7
action_4 (28) = happyShift action_8
action_4 (29) = happyShift action_9
action_4 (31) = happyShift action_10
action_4 (34) = happyShift action_11
action_4 (4) = happyGoto action_16
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_2

action_6 _ = happyReduce_3

action_7 (6) = happyShift action_2
action_7 (21) = happyShift action_4
action_7 (23) = happyShift action_5
action_7 (24) = happyShift action_6
action_7 (25) = happyShift action_7
action_7 (28) = happyShift action_8
action_7 (29) = happyShift action_9
action_7 (31) = happyShift action_10
action_7 (34) = happyShift action_11
action_7 (4) = happyGoto action_15
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_21

action_9 (28) = happyShift action_14
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (6) = happyShift action_2
action_10 (21) = happyShift action_4
action_10 (23) = happyShift action_5
action_10 (24) = happyShift action_6
action_10 (25) = happyShift action_7
action_10 (28) = happyShift action_8
action_10 (29) = happyShift action_9
action_10 (31) = happyShift action_10
action_10 (34) = happyShift action_11
action_10 (4) = happyGoto action_13
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (28) = happyShift action_12
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (33) = happyShift action_51
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (6) = happyShift action_2
action_13 (7) = happyShift action_18
action_13 (8) = happyShift action_19
action_13 (9) = happyShift action_20
action_13 (10) = happyShift action_21
action_13 (11) = happyShift action_22
action_13 (12) = happyShift action_23
action_13 (13) = happyShift action_24
action_13 (14) = happyShift action_25
action_13 (15) = happyShift action_26
action_13 (16) = happyShift action_27
action_13 (17) = happyShift action_28
action_13 (18) = happyShift action_29
action_13 (19) = happyShift action_30
action_13 (20) = happyShift action_31
action_13 (21) = happyShift action_4
action_13 (22) = happyShift action_32
action_13 (23) = happyShift action_5
action_13 (24) = happyShift action_6
action_13 (25) = happyShift action_7
action_13 (28) = happyShift action_8
action_13 (29) = happyShift action_9
action_13 (31) = happyShift action_10
action_13 (32) = happyShift action_50
action_13 (34) = happyShift action_11
action_13 (4) = happyGoto action_17
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (38) = happyShift action_49
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (6) = happyShift action_2
action_15 (7) = happyShift action_18
action_15 (8) = happyShift action_19
action_15 (9) = happyShift action_20
action_15 (10) = happyShift action_21
action_15 (11) = happyShift action_22
action_15 (12) = happyShift action_23
action_15 (13) = happyShift action_24
action_15 (14) = happyShift action_25
action_15 (15) = happyShift action_26
action_15 (16) = happyShift action_27
action_15 (17) = happyShift action_28
action_15 (18) = happyShift action_29
action_15 (19) = happyShift action_30
action_15 (20) = happyShift action_31
action_15 (21) = happyShift action_4
action_15 (22) = happyShift action_32
action_15 (23) = happyShift action_5
action_15 (24) = happyShift action_6
action_15 (25) = happyShift action_7
action_15 (26) = happyShift action_48
action_15 (28) = happyShift action_8
action_15 (29) = happyShift action_9
action_15 (31) = happyShift action_10
action_15 (34) = happyShift action_11
action_15 (4) = happyGoto action_17
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (6) = happyShift action_2
action_16 (7) = happyShift action_18
action_16 (8) = happyShift action_19
action_16 (9) = happyShift action_20
action_16 (10) = happyShift action_21
action_16 (11) = happyShift action_22
action_16 (12) = happyShift action_23
action_16 (13) = happyShift action_24
action_16 (14) = happyShift action_25
action_16 (15) = happyShift action_26
action_16 (16) = happyShift action_27
action_16 (17) = happyShift action_28
action_16 (18) = happyShift action_29
action_16 (19) = happyShift action_30
action_16 (20) = happyShift action_31
action_16 (21) = happyShift action_4
action_16 (22) = happyShift action_32
action_16 (23) = happyShift action_5
action_16 (24) = happyShift action_6
action_16 (25) = happyShift action_7
action_16 (28) = happyShift action_8
action_16 (29) = happyShift action_9
action_16 (31) = happyShift action_10
action_16 (34) = happyShift action_11
action_16 (4) = happyGoto action_17
action_16 _ = happyReduce_18

action_17 (6) = happyShift action_2
action_17 (7) = happyShift action_18
action_17 (8) = happyShift action_19
action_17 (9) = happyShift action_20
action_17 (10) = happyShift action_21
action_17 (11) = happyShift action_22
action_17 (12) = happyShift action_23
action_17 (13) = happyShift action_24
action_17 (14) = happyShift action_25
action_17 (15) = happyShift action_26
action_17 (16) = happyShift action_27
action_17 (17) = happyShift action_28
action_17 (18) = happyShift action_29
action_17 (19) = happyShift action_30
action_17 (20) = happyShift action_31
action_17 (21) = happyShift action_4
action_17 (22) = happyShift action_32
action_17 (23) = happyShift action_5
action_17 (24) = happyShift action_6
action_17 (25) = happyShift action_7
action_17 (28) = happyShift action_8
action_17 (29) = happyShift action_9
action_17 (31) = happyShift action_10
action_17 (34) = happyShift action_11
action_17 (4) = happyGoto action_17
action_17 _ = happyReduce_23

action_18 (6) = happyShift action_2
action_18 (21) = happyShift action_4
action_18 (23) = happyShift action_5
action_18 (24) = happyShift action_6
action_18 (25) = happyShift action_7
action_18 (28) = happyShift action_8
action_18 (29) = happyShift action_9
action_18 (31) = happyShift action_10
action_18 (34) = happyShift action_11
action_18 (4) = happyGoto action_47
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (6) = happyShift action_2
action_19 (21) = happyShift action_4
action_19 (23) = happyShift action_5
action_19 (24) = happyShift action_6
action_19 (25) = happyShift action_7
action_19 (28) = happyShift action_8
action_19 (29) = happyShift action_9
action_19 (31) = happyShift action_10
action_19 (34) = happyShift action_11
action_19 (4) = happyGoto action_46
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (6) = happyShift action_2
action_20 (21) = happyShift action_4
action_20 (23) = happyShift action_5
action_20 (24) = happyShift action_6
action_20 (25) = happyShift action_7
action_20 (28) = happyShift action_8
action_20 (29) = happyShift action_9
action_20 (31) = happyShift action_10
action_20 (34) = happyShift action_11
action_20 (4) = happyGoto action_45
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (6) = happyShift action_2
action_21 (21) = happyShift action_4
action_21 (23) = happyShift action_5
action_21 (24) = happyShift action_6
action_21 (25) = happyShift action_7
action_21 (28) = happyShift action_8
action_21 (29) = happyShift action_9
action_21 (31) = happyShift action_10
action_21 (34) = happyShift action_11
action_21 (4) = happyGoto action_44
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (6) = happyShift action_2
action_22 (21) = happyShift action_4
action_22 (23) = happyShift action_5
action_22 (24) = happyShift action_6
action_22 (25) = happyShift action_7
action_22 (28) = happyShift action_8
action_22 (29) = happyShift action_9
action_22 (31) = happyShift action_10
action_22 (34) = happyShift action_11
action_22 (4) = happyGoto action_43
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (6) = happyShift action_2
action_23 (21) = happyShift action_4
action_23 (23) = happyShift action_5
action_23 (24) = happyShift action_6
action_23 (25) = happyShift action_7
action_23 (28) = happyShift action_8
action_23 (29) = happyShift action_9
action_23 (31) = happyShift action_10
action_23 (34) = happyShift action_11
action_23 (4) = happyGoto action_42
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (6) = happyShift action_2
action_24 (21) = happyShift action_4
action_24 (23) = happyShift action_5
action_24 (24) = happyShift action_6
action_24 (25) = happyShift action_7
action_24 (28) = happyShift action_8
action_24 (29) = happyShift action_9
action_24 (31) = happyShift action_10
action_24 (34) = happyShift action_11
action_24 (4) = happyGoto action_41
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (6) = happyShift action_2
action_25 (21) = happyShift action_4
action_25 (23) = happyShift action_5
action_25 (24) = happyShift action_6
action_25 (25) = happyShift action_7
action_25 (28) = happyShift action_8
action_25 (29) = happyShift action_9
action_25 (31) = happyShift action_10
action_25 (34) = happyShift action_11
action_25 (4) = happyGoto action_40
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (6) = happyShift action_2
action_26 (21) = happyShift action_4
action_26 (23) = happyShift action_5
action_26 (24) = happyShift action_6
action_26 (25) = happyShift action_7
action_26 (28) = happyShift action_8
action_26 (29) = happyShift action_9
action_26 (31) = happyShift action_10
action_26 (34) = happyShift action_11
action_26 (4) = happyGoto action_39
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (6) = happyShift action_2
action_27 (21) = happyShift action_4
action_27 (23) = happyShift action_5
action_27 (24) = happyShift action_6
action_27 (25) = happyShift action_7
action_27 (28) = happyShift action_8
action_27 (29) = happyShift action_9
action_27 (31) = happyShift action_10
action_27 (34) = happyShift action_11
action_27 (4) = happyGoto action_38
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (6) = happyShift action_2
action_28 (21) = happyShift action_4
action_28 (23) = happyShift action_5
action_28 (24) = happyShift action_6
action_28 (25) = happyShift action_7
action_28 (28) = happyShift action_8
action_28 (29) = happyShift action_9
action_28 (31) = happyShift action_10
action_28 (34) = happyShift action_11
action_28 (4) = happyGoto action_37
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (6) = happyShift action_2
action_29 (21) = happyShift action_4
action_29 (23) = happyShift action_5
action_29 (24) = happyShift action_6
action_29 (25) = happyShift action_7
action_29 (28) = happyShift action_8
action_29 (29) = happyShift action_9
action_29 (31) = happyShift action_10
action_29 (34) = happyShift action_11
action_29 (4) = happyGoto action_36
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (6) = happyShift action_2
action_30 (21) = happyShift action_4
action_30 (23) = happyShift action_5
action_30 (24) = happyShift action_6
action_30 (25) = happyShift action_7
action_30 (28) = happyShift action_8
action_30 (29) = happyShift action_9
action_30 (31) = happyShift action_10
action_30 (34) = happyShift action_11
action_30 (4) = happyGoto action_35
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (6) = happyShift action_2
action_31 (21) = happyShift action_4
action_31 (23) = happyShift action_5
action_31 (24) = happyShift action_6
action_31 (25) = happyShift action_7
action_31 (28) = happyShift action_8
action_31 (29) = happyShift action_9
action_31 (31) = happyShift action_10
action_31 (34) = happyShift action_11
action_31 (4) = happyGoto action_34
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (6) = happyShift action_2
action_32 (21) = happyShift action_4
action_32 (23) = happyShift action_5
action_32 (24) = happyShift action_6
action_32 (25) = happyShift action_7
action_32 (28) = happyShift action_8
action_32 (29) = happyShift action_9
action_32 (31) = happyShift action_10
action_32 (34) = happyShift action_11
action_32 (4) = happyGoto action_33
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (6) = happyShift action_2
action_33 (7) = happyShift action_18
action_33 (8) = happyShift action_19
action_33 (9) = happyShift action_20
action_33 (10) = happyShift action_21
action_33 (11) = happyShift action_22
action_33 (12) = happyShift action_23
action_33 (13) = happyShift action_24
action_33 (14) = happyShift action_25
action_33 (15) = happyShift action_26
action_33 (16) = happyShift action_27
action_33 (17) = happyShift action_28
action_33 (18) = happyShift action_29
action_33 (19) = happyShift action_30
action_33 (20) = happyShift action_31
action_33 (21) = happyShift action_4
action_33 (22) = happyShift action_32
action_33 (23) = happyShift action_5
action_33 (24) = happyShift action_6
action_33 (25) = happyShift action_7
action_33 (28) = happyShift action_8
action_33 (29) = happyShift action_9
action_33 (31) = happyShift action_10
action_33 (34) = happyShift action_11
action_33 (4) = happyGoto action_17
action_33 _ = happyReduce_19

action_34 (6) = happyShift action_2
action_34 (7) = happyShift action_18
action_34 (8) = happyShift action_19
action_34 (9) = happyShift action_20
action_34 (10) = happyShift action_21
action_34 (11) = happyShift action_22
action_34 (12) = happyShift action_23
action_34 (13) = happyShift action_24
action_34 (14) = happyShift action_25
action_34 (15) = happyShift action_26
action_34 (16) = happyShift action_27
action_34 (17) = happyShift action_28
action_34 (18) = happyShift action_29
action_34 (19) = happyShift action_30
action_34 (20) = happyShift action_31
action_34 (21) = happyShift action_4
action_34 (22) = happyShift action_32
action_34 (23) = happyShift action_5
action_34 (24) = happyShift action_6
action_34 (25) = happyShift action_7
action_34 (28) = happyShift action_8
action_34 (29) = happyShift action_9
action_34 (31) = happyShift action_10
action_34 (34) = happyShift action_11
action_34 (4) = happyGoto action_17
action_34 _ = happyReduce_17

action_35 (6) = happyShift action_2
action_35 (7) = happyShift action_18
action_35 (8) = happyShift action_19
action_35 (9) = happyShift action_20
action_35 (10) = happyShift action_21
action_35 (11) = happyShift action_22
action_35 (12) = happyShift action_23
action_35 (13) = happyShift action_24
action_35 (14) = happyShift action_25
action_35 (15) = happyShift action_26
action_35 (16) = happyShift action_27
action_35 (17) = happyShift action_28
action_35 (18) = happyShift action_29
action_35 (19) = happyShift action_30
action_35 (20) = happyShift action_31
action_35 (21) = happyShift action_4
action_35 (22) = happyShift action_32
action_35 (23) = happyShift action_5
action_35 (24) = happyShift action_6
action_35 (25) = happyShift action_7
action_35 (28) = happyShift action_8
action_35 (29) = happyShift action_9
action_35 (31) = happyShift action_10
action_35 (34) = happyShift action_11
action_35 (4) = happyGoto action_17
action_35 _ = happyReduce_16

action_36 (6) = happyShift action_2
action_36 (7) = happyShift action_18
action_36 (8) = happyShift action_19
action_36 (9) = happyShift action_20
action_36 (10) = happyShift action_21
action_36 (11) = happyShift action_22
action_36 (12) = happyShift action_23
action_36 (13) = happyShift action_24
action_36 (14) = happyShift action_25
action_36 (15) = happyShift action_26
action_36 (16) = happyShift action_27
action_36 (17) = happyShift action_28
action_36 (18) = happyShift action_29
action_36 (19) = happyShift action_30
action_36 (20) = happyShift action_31
action_36 (21) = happyShift action_4
action_36 (22) = happyShift action_32
action_36 (23) = happyShift action_5
action_36 (24) = happyShift action_6
action_36 (25) = happyShift action_7
action_36 (28) = happyShift action_8
action_36 (29) = happyShift action_9
action_36 (31) = happyShift action_10
action_36 (34) = happyShift action_11
action_36 (4) = happyGoto action_17
action_36 _ = happyReduce_15

action_37 (6) = happyShift action_2
action_37 (7) = happyShift action_18
action_37 (8) = happyShift action_19
action_37 (9) = happyShift action_20
action_37 (10) = happyShift action_21
action_37 (11) = happyShift action_22
action_37 (12) = happyShift action_23
action_37 (13) = happyShift action_24
action_37 (14) = happyShift action_25
action_37 (15) = happyShift action_26
action_37 (16) = happyShift action_27
action_37 (17) = happyShift action_28
action_37 (18) = happyShift action_29
action_37 (19) = happyShift action_30
action_37 (20) = happyShift action_31
action_37 (21) = happyShift action_4
action_37 (22) = happyShift action_32
action_37 (23) = happyShift action_5
action_37 (24) = happyShift action_6
action_37 (25) = happyShift action_7
action_37 (28) = happyShift action_8
action_37 (29) = happyShift action_9
action_37 (31) = happyShift action_10
action_37 (34) = happyShift action_11
action_37 (4) = happyGoto action_17
action_37 _ = happyReduce_14

action_38 (6) = happyShift action_2
action_38 (7) = happyShift action_18
action_38 (8) = happyShift action_19
action_38 (9) = happyShift action_20
action_38 (10) = happyShift action_21
action_38 (11) = happyShift action_22
action_38 (12) = happyShift action_23
action_38 (13) = happyShift action_24
action_38 (14) = happyShift action_25
action_38 (15) = happyShift action_26
action_38 (16) = happyShift action_27
action_38 (17) = happyShift action_28
action_38 (18) = happyShift action_29
action_38 (19) = happyShift action_30
action_38 (20) = happyShift action_31
action_38 (21) = happyShift action_4
action_38 (22) = happyShift action_32
action_38 (23) = happyShift action_5
action_38 (24) = happyShift action_6
action_38 (25) = happyShift action_7
action_38 (28) = happyShift action_8
action_38 (29) = happyShift action_9
action_38 (31) = happyShift action_10
action_38 (34) = happyShift action_11
action_38 (4) = happyGoto action_17
action_38 _ = happyReduce_13

action_39 (6) = happyShift action_2
action_39 (7) = happyShift action_18
action_39 (8) = happyShift action_19
action_39 (9) = happyShift action_20
action_39 (10) = happyShift action_21
action_39 (11) = happyShift action_22
action_39 (12) = happyShift action_23
action_39 (13) = happyShift action_24
action_39 (14) = happyShift action_25
action_39 (15) = happyShift action_26
action_39 (16) = happyShift action_27
action_39 (17) = happyShift action_28
action_39 (18) = happyShift action_29
action_39 (19) = happyShift action_30
action_39 (20) = happyShift action_31
action_39 (21) = happyShift action_4
action_39 (22) = happyShift action_32
action_39 (23) = happyShift action_5
action_39 (24) = happyShift action_6
action_39 (25) = happyShift action_7
action_39 (28) = happyShift action_8
action_39 (29) = happyShift action_9
action_39 (31) = happyShift action_10
action_39 (34) = happyShift action_11
action_39 (4) = happyGoto action_17
action_39 _ = happyReduce_12

action_40 (6) = happyShift action_2
action_40 (7) = happyShift action_18
action_40 (8) = happyShift action_19
action_40 (9) = happyShift action_20
action_40 (10) = happyShift action_21
action_40 (11) = happyShift action_22
action_40 (12) = happyShift action_23
action_40 (13) = happyShift action_24
action_40 (14) = happyShift action_25
action_40 (15) = happyShift action_26
action_40 (16) = happyShift action_27
action_40 (17) = happyShift action_28
action_40 (18) = happyShift action_29
action_40 (19) = happyShift action_30
action_40 (20) = happyShift action_31
action_40 (21) = happyShift action_4
action_40 (22) = happyShift action_32
action_40 (23) = happyShift action_5
action_40 (24) = happyShift action_6
action_40 (25) = happyShift action_7
action_40 (28) = happyShift action_8
action_40 (29) = happyShift action_9
action_40 (31) = happyShift action_10
action_40 (34) = happyShift action_11
action_40 (4) = happyGoto action_17
action_40 _ = happyReduce_11

action_41 (6) = happyShift action_2
action_41 (7) = happyShift action_18
action_41 (8) = happyShift action_19
action_41 (9) = happyShift action_20
action_41 (10) = happyShift action_21
action_41 (11) = happyShift action_22
action_41 (12) = happyShift action_23
action_41 (13) = happyShift action_24
action_41 (14) = happyShift action_25
action_41 (15) = happyShift action_26
action_41 (16) = happyShift action_27
action_41 (17) = happyShift action_28
action_41 (18) = happyShift action_29
action_41 (19) = happyShift action_30
action_41 (20) = happyShift action_31
action_41 (21) = happyShift action_4
action_41 (22) = happyShift action_32
action_41 (23) = happyShift action_5
action_41 (24) = happyShift action_6
action_41 (25) = happyShift action_7
action_41 (28) = happyShift action_8
action_41 (29) = happyShift action_9
action_41 (31) = happyShift action_10
action_41 (34) = happyShift action_11
action_41 (4) = happyGoto action_17
action_41 _ = happyReduce_10

action_42 (6) = happyShift action_2
action_42 (7) = happyShift action_18
action_42 (8) = happyShift action_19
action_42 (9) = happyShift action_20
action_42 (10) = happyShift action_21
action_42 (11) = happyShift action_22
action_42 (12) = happyShift action_23
action_42 (13) = happyShift action_24
action_42 (14) = happyShift action_25
action_42 (15) = happyShift action_26
action_42 (16) = happyShift action_27
action_42 (17) = happyShift action_28
action_42 (18) = happyShift action_29
action_42 (19) = happyShift action_30
action_42 (20) = happyShift action_31
action_42 (21) = happyShift action_4
action_42 (22) = happyShift action_32
action_42 (23) = happyShift action_5
action_42 (24) = happyShift action_6
action_42 (25) = happyShift action_7
action_42 (28) = happyShift action_8
action_42 (29) = happyShift action_9
action_42 (31) = happyShift action_10
action_42 (34) = happyShift action_11
action_42 (4) = happyGoto action_17
action_42 _ = happyReduce_9

action_43 (6) = happyShift action_2
action_43 (7) = happyShift action_18
action_43 (8) = happyShift action_19
action_43 (9) = happyShift action_20
action_43 (10) = happyShift action_21
action_43 (11) = happyShift action_22
action_43 (12) = happyShift action_23
action_43 (13) = happyShift action_24
action_43 (14) = happyShift action_25
action_43 (15) = happyShift action_26
action_43 (16) = happyShift action_27
action_43 (17) = happyShift action_28
action_43 (18) = happyShift action_29
action_43 (19) = happyShift action_30
action_43 (20) = happyShift action_31
action_43 (21) = happyShift action_4
action_43 (22) = happyShift action_32
action_43 (23) = happyShift action_5
action_43 (24) = happyShift action_6
action_43 (25) = happyShift action_7
action_43 (28) = happyShift action_8
action_43 (29) = happyShift action_9
action_43 (31) = happyShift action_10
action_43 (34) = happyShift action_11
action_43 (4) = happyGoto action_17
action_43 _ = happyReduce_8

action_44 (6) = happyShift action_2
action_44 (7) = happyShift action_18
action_44 (8) = happyShift action_19
action_44 (9) = happyShift action_20
action_44 (10) = happyShift action_21
action_44 (11) = happyShift action_22
action_44 (12) = happyShift action_23
action_44 (13) = happyShift action_24
action_44 (14) = happyShift action_25
action_44 (15) = happyShift action_26
action_44 (16) = happyShift action_27
action_44 (17) = happyShift action_28
action_44 (18) = happyShift action_29
action_44 (19) = happyShift action_30
action_44 (20) = happyShift action_31
action_44 (21) = happyShift action_4
action_44 (22) = happyShift action_32
action_44 (23) = happyShift action_5
action_44 (24) = happyShift action_6
action_44 (25) = happyShift action_7
action_44 (28) = happyShift action_8
action_44 (29) = happyShift action_9
action_44 (31) = happyShift action_10
action_44 (34) = happyShift action_11
action_44 (4) = happyGoto action_17
action_44 _ = happyReduce_7

action_45 (6) = happyShift action_2
action_45 (7) = happyShift action_18
action_45 (8) = happyShift action_19
action_45 (9) = happyShift action_20
action_45 (10) = happyShift action_21
action_45 (11) = happyShift action_22
action_45 (12) = happyShift action_23
action_45 (13) = happyShift action_24
action_45 (14) = happyShift action_25
action_45 (15) = happyShift action_26
action_45 (16) = happyShift action_27
action_45 (17) = happyShift action_28
action_45 (18) = happyShift action_29
action_45 (19) = happyShift action_30
action_45 (20) = happyShift action_31
action_45 (21) = happyShift action_4
action_45 (22) = happyShift action_32
action_45 (23) = happyShift action_5
action_45 (24) = happyShift action_6
action_45 (25) = happyShift action_7
action_45 (28) = happyShift action_8
action_45 (29) = happyShift action_9
action_45 (31) = happyShift action_10
action_45 (34) = happyShift action_11
action_45 (4) = happyGoto action_17
action_45 _ = happyReduce_6

action_46 (6) = happyShift action_2
action_46 (7) = happyShift action_18
action_46 (8) = happyShift action_19
action_46 (9) = happyShift action_20
action_46 (10) = happyShift action_21
action_46 (11) = happyShift action_22
action_46 (12) = happyShift action_23
action_46 (13) = happyShift action_24
action_46 (14) = happyShift action_25
action_46 (15) = happyShift action_26
action_46 (16) = happyShift action_27
action_46 (17) = happyShift action_28
action_46 (18) = happyShift action_29
action_46 (19) = happyShift action_30
action_46 (20) = happyShift action_31
action_46 (21) = happyShift action_4
action_46 (22) = happyShift action_32
action_46 (23) = happyShift action_5
action_46 (24) = happyShift action_6
action_46 (25) = happyShift action_7
action_46 (28) = happyShift action_8
action_46 (29) = happyShift action_9
action_46 (31) = happyShift action_10
action_46 (34) = happyShift action_11
action_46 (4) = happyGoto action_17
action_46 _ = happyReduce_5

action_47 (6) = happyShift action_2
action_47 (8) = happyShift action_19
action_47 (9) = happyShift action_20
action_47 (10) = happyShift action_21
action_47 (11) = happyShift action_22
action_47 (12) = happyShift action_23
action_47 (13) = happyShift action_24
action_47 (14) = happyShift action_25
action_47 (15) = happyShift action_26
action_47 (16) = happyShift action_27
action_47 (17) = happyShift action_28
action_47 (18) = happyShift action_29
action_47 (19) = happyShift action_30
action_47 (20) = happyShift action_31
action_47 (21) = happyShift action_4
action_47 (22) = happyShift action_32
action_47 (23) = happyShift action_5
action_47 (24) = happyShift action_6
action_47 (25) = happyShift action_7
action_47 (28) = happyShift action_8
action_47 (29) = happyShift action_9
action_47 (31) = happyShift action_10
action_47 (34) = happyShift action_11
action_47 (4) = happyGoto action_17
action_47 _ = happyReduce_4

action_48 (6) = happyShift action_2
action_48 (21) = happyShift action_4
action_48 (23) = happyShift action_5
action_48 (24) = happyShift action_6
action_48 (25) = happyShift action_7
action_48 (28) = happyShift action_8
action_48 (29) = happyShift action_9
action_48 (31) = happyShift action_10
action_48 (34) = happyShift action_11
action_48 (4) = happyGoto action_57
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (31) = happyShift action_54
action_49 (36) = happyShift action_55
action_49 (37) = happyShift action_56
action_49 (5) = happyGoto action_53
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_24

action_51 (6) = happyShift action_2
action_51 (21) = happyShift action_4
action_51 (23) = happyShift action_5
action_51 (24) = happyShift action_6
action_51 (25) = happyShift action_7
action_51 (28) = happyShift action_8
action_51 (29) = happyShift action_9
action_51 (31) = happyShift action_10
action_51 (34) = happyShift action_11
action_51 (4) = happyGoto action_52
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (6) = happyShift action_2
action_52 (7) = happyShift action_18
action_52 (8) = happyShift action_19
action_52 (9) = happyShift action_20
action_52 (10) = happyShift action_21
action_52 (11) = happyShift action_22
action_52 (12) = happyShift action_23
action_52 (13) = happyShift action_24
action_52 (14) = happyShift action_25
action_52 (15) = happyShift action_26
action_52 (16) = happyShift action_27
action_52 (17) = happyShift action_28
action_52 (18) = happyShift action_29
action_52 (19) = happyShift action_30
action_52 (20) = happyShift action_31
action_52 (21) = happyShift action_4
action_52 (22) = happyShift action_32
action_52 (23) = happyShift action_5
action_52 (24) = happyShift action_6
action_52 (25) = happyShift action_7
action_52 (28) = happyShift action_8
action_52 (29) = happyShift action_9
action_52 (31) = happyShift action_10
action_52 (34) = happyShift action_11
action_52 (35) = happyShift action_61
action_52 (4) = happyGoto action_17
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (30) = happyShift action_60
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (31) = happyShift action_54
action_54 (36) = happyShift action_55
action_54 (37) = happyShift action_56
action_54 (5) = happyGoto action_59
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_26

action_56 _ = happyReduce_27

action_57 (6) = happyShift action_2
action_57 (7) = happyShift action_18
action_57 (8) = happyShift action_19
action_57 (9) = happyShift action_20
action_57 (10) = happyShift action_21
action_57 (11) = happyShift action_22
action_57 (12) = happyShift action_23
action_57 (13) = happyShift action_24
action_57 (14) = happyShift action_25
action_57 (15) = happyShift action_26
action_57 (16) = happyShift action_27
action_57 (17) = happyShift action_28
action_57 (18) = happyShift action_29
action_57 (19) = happyShift action_30
action_57 (20) = happyShift action_31
action_57 (21) = happyShift action_4
action_57 (22) = happyShift action_32
action_57 (23) = happyShift action_5
action_57 (24) = happyShift action_6
action_57 (25) = happyShift action_7
action_57 (27) = happyShift action_58
action_57 (28) = happyShift action_8
action_57 (29) = happyShift action_9
action_57 (31) = happyShift action_10
action_57 (34) = happyShift action_11
action_57 (4) = happyGoto action_17
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (6) = happyShift action_2
action_58 (21) = happyShift action_4
action_58 (23) = happyShift action_5
action_58 (24) = happyShift action_6
action_58 (25) = happyShift action_7
action_58 (28) = happyShift action_8
action_58 (29) = happyShift action_9
action_58 (31) = happyShift action_10
action_58 (34) = happyShift action_11
action_58 (4) = happyGoto action_65
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (30) = happyShift action_64
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (6) = happyShift action_2
action_60 (21) = happyShift action_4
action_60 (23) = happyShift action_5
action_60 (24) = happyShift action_6
action_60 (25) = happyShift action_7
action_60 (28) = happyShift action_8
action_60 (29) = happyShift action_9
action_60 (31) = happyShift action_10
action_60 (34) = happyShift action_11
action_60 (4) = happyGoto action_63
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (6) = happyShift action_2
action_61 (21) = happyShift action_4
action_61 (23) = happyShift action_5
action_61 (24) = happyShift action_6
action_61 (25) = happyShift action_7
action_61 (28) = happyShift action_8
action_61 (29) = happyShift action_9
action_61 (31) = happyShift action_10
action_61 (34) = happyShift action_11
action_61 (4) = happyGoto action_62
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (6) = happyShift action_2
action_62 (7) = happyShift action_18
action_62 (8) = happyShift action_19
action_62 (9) = happyShift action_20
action_62 (10) = happyShift action_21
action_62 (11) = happyShift action_22
action_62 (12) = happyShift action_23
action_62 (13) = happyShift action_24
action_62 (14) = happyShift action_25
action_62 (15) = happyShift action_26
action_62 (16) = happyShift action_27
action_62 (17) = happyShift action_28
action_62 (18) = happyShift action_29
action_62 (19) = happyShift action_30
action_62 (20) = happyShift action_31
action_62 (21) = happyShift action_4
action_62 (22) = happyShift action_32
action_62 (23) = happyShift action_5
action_62 (24) = happyShift action_6
action_62 (25) = happyShift action_7
action_62 (28) = happyShift action_8
action_62 (29) = happyShift action_9
action_62 (31) = happyShift action_10
action_62 (34) = happyShift action_11
action_62 (4) = happyGoto action_17
action_62 _ = happyReduce_25

action_63 (6) = happyShift action_2
action_63 (7) = happyShift action_18
action_63 (8) = happyShift action_19
action_63 (9) = happyShift action_20
action_63 (10) = happyShift action_21
action_63 (11) = happyShift action_22
action_63 (12) = happyShift action_23
action_63 (13) = happyShift action_24
action_63 (14) = happyShift action_25
action_63 (15) = happyShift action_26
action_63 (16) = happyShift action_27
action_63 (17) = happyShift action_28
action_63 (18) = happyShift action_29
action_63 (19) = happyShift action_30
action_63 (20) = happyShift action_31
action_63 (21) = happyShift action_4
action_63 (22) = happyShift action_32
action_63 (23) = happyShift action_5
action_63 (24) = happyShift action_6
action_63 (25) = happyShift action_7
action_63 (28) = happyShift action_8
action_63 (29) = happyShift action_9
action_63 (31) = happyShift action_10
action_63 (34) = happyShift action_11
action_63 (4) = happyGoto action_17
action_63 _ = happyReduce_22

action_64 (31) = happyShift action_54
action_64 (36) = happyShift action_55
action_64 (37) = happyShift action_56
action_64 (5) = happyGoto action_66
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (6) = happyShift action_2
action_65 (7) = happyShift action_18
action_65 (8) = happyShift action_19
action_65 (9) = happyShift action_20
action_65 (10) = happyShift action_21
action_65 (11) = happyShift action_22
action_65 (12) = happyShift action_23
action_65 (13) = happyShift action_24
action_65 (14) = happyShift action_25
action_65 (15) = happyShift action_26
action_65 (16) = happyShift action_27
action_65 (17) = happyShift action_28
action_65 (18) = happyShift action_29
action_65 (19) = happyShift action_30
action_65 (20) = happyShift action_31
action_65 (21) = happyShift action_4
action_65 (22) = happyShift action_32
action_65 (23) = happyShift action_5
action_65 (24) = happyShift action_6
action_65 (25) = happyShift action_7
action_65 (28) = happyShift action_8
action_65 (29) = happyShift action_9
action_65 (31) = happyShift action_10
action_65 (34) = happyShift action_11
action_65 (4) = happyGoto action_17
action_65 _ = happyReduce_20

action_66 (32) = happyShift action_67
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_28

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenNum happy_var_1))
	 =  HappyAbsSyn4
		 (Num happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 _
	 =  HappyAbsSyn4
		 (BTrue
	)

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (BFalse
	)

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Add happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (And happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Or happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Nand happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Nor happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Xor happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  4 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Igual happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  4 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Diferente happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Maior happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Maiorigual happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Menor happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  4 happyReduction_17
happyReduction_17 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Menorigual happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  4 happyReduction_18
happyReduction_18 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Fat happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  4 happyReduction_19
happyReduction_19 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Pot happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 6 4 happyReduction_20
happyReduction_20 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_1  4 happyReduction_21
happyReduction_21 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn4
		 (Var happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happyReduce 6 4 happyReduction_22
happyReduction_22 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lam happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_2  4 happyReduction_23
happyReduction_23 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (App happy_var_1 happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  4 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Paren happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 6 4 happyReduction_25
happyReduction_25 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_1  5 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn5
		 (TBool
	)

happyReduce_27 = happySpecReduce_1  5 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn5
		 (TNum
	)

happyReduce_28 = happyReduce 5 5 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TFun happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 39 39 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenNum happy_dollar_dollar -> cont 6;
	TokenAdd -> cont 7;
	TokenMul -> cont 8;
	TokenSub -> cont 9;
	TokenAnd -> cont 10;
	TokenOr -> cont 11;
	TokenNand -> cont 12;
	TokenNor -> cont 13;
	TokenXor -> cont 14;
	TokenIgual -> cont 15;
	TokenDiferente -> cont 16;
	TokenMaior -> cont 17;
	TokenMaiorigual -> cont 18;
	TokenMenor -> cont 19;
	TokenMenorigual -> cont 20;
	TokenFat -> cont 21;
	TokenPot -> cont 22;
	TokenTrue -> cont 23;
	TokenFalse -> cont 24;
	TokenIf -> cont 25;
	TokenThen -> cont 26;
	TokenElse -> cont 27;
	TokenVar happy_dollar_dollar -> cont 28;
	TokenLam -> cont 29;
	TokenArrow -> cont 30;
	TokenLParen -> cont 31;
	TokenRParen -> cont 32;
	TokenEq -> cont 33;
	TokenLet -> cont 34;
	TokenIn -> cont 35;
	TokenBoolean -> cont 36;
	TokenNumber -> cont 37;
	TokenColon -> cont 38;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 39 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parserError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parserError :: [Token] -> a 
parserError _ = error "Syntax error!"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































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
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
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
     = case happyDrop (k - ((1) :: Int)) sts of
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





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

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
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
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
