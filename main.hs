module Main where
import System.Entropy
import System.Environment
import Data.ByteString.Base64 as B64

main :: IO ()
main = do
        entropy <- getEntropy 22
        print ( B64.encode entropy)
