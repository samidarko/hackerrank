-- https://www.hackerrank.com/challenges/super-digit/problem

import Data.Char (digitToInt)

makep k n = show $ k * (sum $ map digitToInt n)

superDigit p
  | length p == 1 = p
  | otherwise = superDigit $ show $ sum $ map digitToInt p

main :: IO ()
main = do
  l <- getLine
  let l_s = words l
  let n = l_s !! 0
  let k = read (l_s !! 1) :: Int
  putStrLn $ superDigit $ makep k n
