module Codewars.Kata.Deadfish (parse) where

import Control.Monad.RWS (RWS, evalRWS, get, modify, tell)

parse :: String -> [Int]
parse str = snd $ evalRWS (traverse go str) () 0
  where
    go :: Char -> RWS () [Int] Int ()
    go 'i' = modify (+ 1)
    go 'd' = modify (flip (-) 1)
    go 's' = modify (^ 2)
    go 'o' = get >>= \n -> tell [n]
    go _ = pure ()
