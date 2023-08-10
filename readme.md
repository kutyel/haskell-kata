# Haskell Katas from CodeWars! 🥷🏻

This is the repo I use to solve the katas in Haskell and maybe ocasionally stream on Twitch. 🤞🏻

## Usage

As any normal H:qaskell project, you just fire everything inside _ghci_ and tweak the code until it works:

```sh
Configuring GHCi with the following packages:
GHCi, version 9.4.5: https://www.haskell.org/ghc/  :? for help
ghci> :l Codewars.Kata.Braces
[1 of 1] Compiling Codewars.Kata.Braces ( Codewars/Kata/Braces.hs, interpreted )
Ok, one module loaded.
ghci> main
```

In case you need to load up _ghci_ with packages again:

```sh
stack repl --package megaparsec
```

In theory, the Cabal version should work too (`cabal repl --ghc-option='-package megaparsec'`) but we both know how useless Cabal is... 😏
