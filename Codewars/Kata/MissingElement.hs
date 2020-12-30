module Codewars.Kata.MissingElement where

import Data.List (foldl')

-- remember: sum [0..9] == 45...
getMissingElement :: [Int] -> Int
getMissingElement = foldl' (-) 45
