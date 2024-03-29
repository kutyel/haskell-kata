{-# LANGUAGE FlexibleContexts #-}

module Codewars.Kata.Braces where

import Data.Either (isRight)
import Text.Megaparsec (MonadParsec (eof), between, many, runParser, (<|>))
import Text.Megaparsec.Char (char)

braces :: (MonadParsec Char String m) => m String
braces = between (char '{') (char '}') manyBraces

brackets :: (MonadParsec Char String m) => m String
brackets = between (char '[') (char ']') manyBraces

parens :: (MonadParsec Char String m) => m String
parens = between (char '(') (char ')') manyBraces

manyBraces :: (MonadParsec Char String m) => m String
manyBraces = concat <$> many (parens <|> brackets <|> braces)

validBraces :: String -> Bool
validBraces = isRight . runParser parser ""
 where
  parser = manyBraces <* eof

validBraces' :: String -> Bool
validBraces' = (== "") . foldr collapse []
 where
  collapse :: Char -> String -> String
  collapse '(' (')' : xs) = xs
  collapse '{' ('}' : xs) = xs
  collapse '[' (']' : xs) = xs
  collapse x xs = x : xs

main :: IO ()
main = do
  print $ validBraces "()" -- True
  print $ validBraces "[([)" -- False
  print $ validBraces "())({}}{()][][" -- False
  print $ validBraces "({})[({})]" -- True
  print $ validBraces "(){}[]" -- True
  print $ validBraces "([{}])" -- True
  print $ validBraces "(}" -- False
  print $ validBraces "[(])" -- False
  print $ validBraces "[({})](]" -- False
