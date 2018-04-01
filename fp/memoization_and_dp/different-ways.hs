-- https://www.hackerrank.com/challenges/different-ways-fp/problem

fact :: (Enum a, Num a) => a -> a
fact n = product [1..n]

combinations :: Integral a => a -> a -> a
combinations n k
  | k == 0 = 1
  | k == n = 1
  | otherwise = (fact n `div` (fact (n-k) * fact k)) -- `mod` (10^8+7)

processLine s = combinations n' k'
  where toInt x = read x :: Int
        [n, k] = words s
        n' = toInt n
        k' = toInt k

main :: IO ()
main = do
    getLine
    contents <- getContents
    mapM_ (print . processLine) $ lines contents
