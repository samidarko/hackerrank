-- https://www.hackerrank.com/challenges/camelcase/problem
import System.IO
import Data.Char (isUpper)


main :: IO ()
main = do
    s <- getLine
    print $ foldl (\acc c -> if isUpper c then acc+1 else acc) 1 s
