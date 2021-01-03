module Codewars.Kata.FactorialComposition (decomp) where

import Data.List (group, intersperse, sort)

primeFactors :: Int -> [Int]
primeFactors 1 = []
primeFactors n = nextFactor : primeFactors (div n nextFactor)
  where
    nextFactor = head [i | i <- [2 .. n], 0 == mod n i]

toStr :: [[Int]] -> String
toStr = unwords . intersperse "*" . map (\xs -> show (head xs) ++ exp (length xs))
  where
    exp 1 = ""
    exp n = "^" ++ show n

allFactors :: Int -> [[Int]]
allFactors = group . sort . decomp'
  where
    decomp' 1 = []
    decomp' n = primeFactors n ++ decomp' (n - 1)

decomp :: Int -> String
decomp = toStr . allFactors
