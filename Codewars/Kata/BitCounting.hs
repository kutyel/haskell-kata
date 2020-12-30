module Codewars.Kata.BitCounting (countBits, countBits') where

import Data.Bits (popCount)

countBits :: Int -> Int
countBits = popCount

-- Top voted answer 😅
countBits' :: Int -> Int
countBits' 0 = 0
countBits' n = n `mod` 2 + countBits' (n `div` 2)
