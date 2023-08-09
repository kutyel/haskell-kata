{-# LANGUAGE FlexibleContexts #-}

module Codewars.Kata.Braces where

import Data.Either (isRight)
import Text.Megaparsec (MonadParsec (eof), many, runParser, (<|>))
import Text.Megaparsec.Char (char, string)

braces :: (MonadParsec Char String m) => m String
braces = char '{' *> (manyBraces <|> string "") <* char '}'

brackets :: (MonadParsec Char String m) => m String
brackets = char '[' *> (manyBraces <|> string "") <* char ']'

parens :: (MonadParsec Char String m) => m String
parens = char '(' *> (manyBraces <|> string "") <* char ')'

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
