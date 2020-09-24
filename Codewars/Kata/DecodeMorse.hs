module Codewars.Kata.DecodeMorse where

import Codewars.Kata.DecodeMorse.Preload (morseCodes, test, test2)
import Data.List.Split (splitOn)
import Data.Map.Strict ((!))

decodeMorse :: String -> String
decodeMorse = unwords . filter (not . null) . map ((>>= (morseCodes !)) . words) . splitOn "   "
