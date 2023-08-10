{-# LANGUAGE FlexibleContexts #-}

module Codewars.Kata.Braces where

import Data.Either (isRight)
import Text.Megaparsec (MonadParsec (eof), between, many, runParser, (<|>))
import Text.Megaparsec.Char (char, string)

braces :: (MonadParsec Char String m) => m String
braces = between (char '{') (char '}') (manyBraces <|> string "")

brackets :: (MonadParsec Char String m) => m String
brackets = between (char '[') (char ']') (manyBraces <|> string "")

parens :: (MonadParsec Char String m) => m String
parens = between (char '(') (char ')') (manyBraces <|> string "")

manyBraces :: (MonadParsec Char String m) => m String
manyBraces = concat <$> many (parens <|> brackets <|> braces)

validBraces :: String -> Bool
validBraces = isRight . runParser parser ""
 where
  parser = manyBraces <* eof

main :: IO ()
main = do
  print $ validBraces "()"
  print $ validBraces "[([)"
  print $ validBraces "())({}}{()][]["
  print $ validBraces "({})[({})]"
