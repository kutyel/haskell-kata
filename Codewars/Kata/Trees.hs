{-# LANGUAGE DeriveFoldable #-}
{-# LANGUAGE DeriveFunctor #-}

module Codewars.Kata.Trees where

data Tree a
    = Leaf
    | Node a (Tree a) (Tree a)
    deriving (Functor, Foldable)

t = Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)
