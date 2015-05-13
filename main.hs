module Main where
import System.Entropy
import qualified Data.ByteString as B
import System.Environment
import Codec.Binary.Base85 as B85
import Codec.Binary.Base64 as B64

getEncoder "B64" = B64.encode
getEncoder "B85" = B85.encode
getEncoder _ = error "No Encoder found"

main :: IO ()
main = do
        enc:len:_ <- getArgs
        let length = read $ len :: Int
        entropy <- getEntropy length
        let pass = ((getEncoder enc) . B.unpack) entropy
        putStrLn pass

