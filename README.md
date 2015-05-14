# password_generator

A quick app to generate a longass random string. 

The basic inteface is `./password-generator <base> <length>`

Here's an example setup: 

```
cabal sandbox init
cabal install --only-dependencies 
cabal build
./dist/build/password-generator/password-generator 85 120
"_XRW\"[)Q=$3(@C<%>qq2J3-9gTf'G=9JN1ljX6%O(^-sQen-_<JSg;u3)Fi*_S`/UlD>HBCS.\\6\"]#etpehZ'^q!ql!\"U%)?6\"$q=jT0,$RLu\"R\"Cr[E1,b%Sm$-fp.9^&b<A=u\\J60`*#r;?6UOM7"

```
You can put whatever base you want. 

###TODO: 
Exclusionary characters. 
