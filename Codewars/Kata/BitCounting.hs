module Codewars.Kata.BitCounting (countBits, countBits') where

import Data.Char (digitToInt, intToDigit)
import Numeric (showIntAtBase)

toBinary :: Int -> String
toBinary x = showIntAtBase 2 intToDigit x ""

countBits :: Int -> Int
countBits = sum . fmap digitToInt . filter (== '1') . toBinary

-- Top voted answer 😅
countBits' :: Int -> Int
countBits' 0 = 0
countBits' n = n `mod` 2 + countBits' (n `div` 2)
