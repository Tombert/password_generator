module Main where
import System.Entropy
import qualified Data.ByteString as B
import System.Environment
import Numeric (showIntAtBase)
import Data.Char (intToDigit, chr)
import Data.List.Split

bytesToBits :: B.ByteString -> String
bytesToBits = (foldl (++) "") . (map (\x -> showIntAtBase 2 intToDigit x "") ) . (map (\x -> x :: Int)) . (map fromIntegral) . B.unpack

bin2dec :: String -> Int
bin2dec = foldr (\c s -> s * 2 + c) 0 . reverse . map c2i
    where c2i c = if c == '0' then 0 else 1

intListToString = map chr

entropyToHash = (map bin2dec) . (splitEvery 7) . bytesToBits

main :: IO ()
main = do
        base:len:_ <- getArgs
        let realBase = read $ base :: Int
        let length = read len :: Int
        entropy <- getEntropy 300
        let filters = filter (<127) . filter (> (127 - realBase))
        let hash = take length ((intListToString . filters . entropyToHash) entropy)
        putStrLn hash
