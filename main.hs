module Main where
import System.Entropy
import qualified Data.ByteString as B
import System.Environment
import Codec.Binary.Base85 as B85

toBase85 :: B.ByteString -> String
toBase85 = B85.encode . B.unpack

main :: IO ()
main = do
        args <- getArgs
        let length = read $ args !! 0 :: Int
        entropy <- getEntropy length
        let blah = toBase85 entropy
        print blah
