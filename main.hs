module Main where
import System.Environment
import Data.Maybe
import qualified Data.ByteString.Lazy as BS

-- This is a constant and (I think) every printable character.  
alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-=!@#$%^&*()_+[]\\{}|;':\",./<>?`~"

-- This is utility function that simply "subtracts" a list from a list. The flip is 
-- there because it's generally easier to partially apply the subtracting list, not the
-- main list. 
stripElems = filter . flip notElem 

-- This simply converts a Bytestring into a Word8 list, then converts the word8s into 
-- Ints
toIntegers = (map fromIntegral) . BS.unpack 

-- This really should be nested in the main `do` block.  This is a helper function to
-- normalize the argument params. 
cleanupArgs (x:y:[]) = (x,y)
cleanupArgs (x:[]) = (x, "")
cleanupArgs [] = error "Please specify a password length."

main :: IO ()
main = do 
        -- Grab the command line arguments. 
        args <- getArgs
        
        -- Call our little helper function to normalize the arguments for processing
        -- because I will be damned before I write a case statement. 
        let (len, excludes) = cleanupArgs args
        
        -- Strip out any of specefied exclusionary characters. 
        let alph  = stripElems excludes alphabet
        
        -- Parse out the length of the password as an int. 
        let l = read len :: Int
        
        -- Get a lazy handle on our entropy. 
        entropy <- BS.readFile "/dev/random"
        
        -- This is a long, convoluted thing that I'll admit should be broken up.  Basically, first
        -- convert the entropy stream to integers.  After that, we chop out any numbers that are bigger
        -- than the maximum size of our alphabet.  Afterwards, we can simply grab letters from our alphabet
        -- by index.  Finally, once we are all done, and because this is lazy and infinite, we finish this
        -- all off by taking the number of elements specified. 
        let chars = take l ( (map ((!!) alph)) . (filter (<(length alph))) .toIntegers $ entropy)
        
        -- Once all of this is done, we can happily spit back a password to the screen. 
        putStrLn chars
