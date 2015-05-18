# password_generator

A quick app to generate a longass random string. 

The basic inteface is `./password-generator <base> <length>`

Here's an example setup: 

```
cabal sandbox init
cabal install --only-dependencies 
cabal build
cabal run 10 abc
HK'MzC*7V$
```
The first argument is the lenght of the requested password, while the second is simply the characters you don't want to show up (some websites don't allow certain characters)

-----

As of right now, this only supports *nix-ey OS's, simply because Windows doesn't have `/dev/random`.  That said, this might work on Cygwin. 
