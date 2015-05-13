# password_generator
A quick thing in haskell to generate a base64 password

I didn't build a cabal file.  Here's the setup

```
cabal install entropy
cabal install dataenc
ghc main.hs
./main B85 120
"_XRW\"[)Q=$3(@C<%>qq2J3-9gTf'G=9JN1ljX6%O(^-sQen-_<JSg;u3)Fi*_S`/UlD>HBCS.\\6\"]#etpehZ'^q!ql!\"U%)?6\"$q=jT0,$RLu\"R\"Cr[E1,b%Sm$-fp.9^&b<A=u\\J60`*#r;?6UOM7"

```
