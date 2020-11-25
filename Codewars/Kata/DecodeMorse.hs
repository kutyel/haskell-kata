module Codewars.Kata.DecodeMorse where

import Codewars.Kata.DecodeMorse.Preload (morseCodes)
import Control.Monad ((<=<))
import Data.List.Split (splitOn)
import Data.Map.Strict ((!))

decodeMorse :: String -> String
decodeMorse = unwords . filter (not . null) . map ((morseCodes !) <=< words) . splitOn "   "
