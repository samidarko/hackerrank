-- https://www.hackerrank.com/challenges/find-the-median/problem
import qualified Data.List as L

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    arr_temp <- getLine
    let arr = map read $ words arr_temp :: [Int]
    print $ (L.sort arr) !! (length arr `div` 2)
