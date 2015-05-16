module Main where
import System.Environment
import Data.Maybe
import qualified Data.ByteString.Lazy as BS

alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-=!@#$%^&*()_+[]\\{}|;':\",./<>?`~"

stripElems = filter . flip notElem 

toIntegers = (map fromIntegral) . BS.unpack 

cleanupArgs (x:y:[]) = (x,y)
cleanupArgs (x:[]) = (x, "")

main :: IO ()
main = do 
        args <- getArgs
        let (len, excludes) = cleanupArgs args
        let alph  = stripElems excludes alphabet
        let l = read len :: Int
        entropy <- BS.readFile "/dev/random"
        let chars = take l ( (map ((!!) alph)) . (filter (<(length alph))) .toIntegers $ entropy)
        putStrLn chars
