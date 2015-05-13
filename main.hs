module Main where
import System.Entropy
import System.Environment
import Data.ByteString.Base64 as B64

main :: IO ()
main = do
        args <- getArgs
        entropy <- getEntropy (read (args !! 0) :: Int)
        print ( B64.encode entropy)
