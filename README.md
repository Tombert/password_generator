# password_generator
A quick thing in haskell to generate a base64 password

I didn't build a cabal file.  Here's the setup

```
cabal install entropy
cabal install base64-bytestring
ghc main.hs
./main 120
"zB69oxUgvPmtz5g4VnvEZgjxWIE9cSTx8zPufg6XLGzCVOC2/+CJmtAxatom+mkwVaNnw7RH3vKtEbtMWC3zPbrssHW/8D9Kx1+r4LCAY5KzKYF1E2BGxx92lwD7RxxHh4i7IBA7ZF8I/xCxnPuNsLKCe+Q5NEbN"

```
