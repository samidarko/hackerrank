-- https://www.hackerrank.com/challenges/recursive-digit-sum/problem
import Data.Char (digitToInt)

makep k n = show $ k * (sum $ map digitToInt n)

superDigit p
  | length p == 1 = p
  | otherwise = superDigit $ show $ sum $ map digitToInt p

main :: IO ()
main = do
    n_temp <- getLine
    let n_t = words n_temp
    let n = n_t!!0
    let k = read $ n_t!!1 :: Int
    putStrLn . superDigit $ makep k n
