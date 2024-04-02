module Codewars.Kata.Parsers where

import Control.Applicative ((<|>))
import Text.Trifecta (Parser, char, runParser, stringLiteral, symbol)

data Import
    = Idl String
    | Protocol String
    | Schema String
    deriving (Eq, Show, Ord)

parser :: Parser Import
parser =
    symbol "import"
        *> ( importHelper Idl "idl"
                <|> importHelper Protocol "protocol"
                <|> importHelper Schema "schema"
           )
  where
    importHelper :: (String -> Import) -> String -> Parser Import
    importHelper f s = f <$> (symbol s *> stringLiteral <* char ';')

main :: IO ()
main = do
    print $ runParser parser mempty "import protocol \"foo.avpr\";"

-- > Success (Protocol "foo.avpr")