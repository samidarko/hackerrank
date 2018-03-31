-- https://www.hackerrank.com/challenges/minimum-absolute-difference-in-an-array/problem
import Data.List (sort)

main :: IO ()
main = do
  n_temp <- getLine
  let n = read n_temp :: Int
  arr_temp <- getLine
  let arr = sort (map read $ words arr_temp :: [Int])
  print $ foldl (\acc (x, y) -> min acc (abs (x-y)) ) (last arr) $ zip (last arr : init arr) arr
