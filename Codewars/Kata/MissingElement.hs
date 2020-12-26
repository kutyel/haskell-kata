module Codewars.Kata.MissingElement where

import Data.List ((\\))

getMissingElement :: [Int] -> Int
getMissingElement = head . (\\) [0 .. 9]
