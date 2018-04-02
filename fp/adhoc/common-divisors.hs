-- https://www.hackerrank.com/challenges/common-divisors/problem
import qualified Data.Set as S

findDivisors :: (RealFrac a, Integral b, Floating a) => a -> [b]
findDivisors n = fn (truncate . sqrt $ n)
    where
        n' = truncate n
        fn i
          | i == 1 = 1:n':[]
          | n' `mod` i == 0 = let n_by_i = (n' `div` i)
                               in if n_by_i == i then i : fn next
                                                 else i : n_by_i : fn next
          | otherwise = fn next
            where next = i-1

preProcess l = map read $ words l :: [Double]

process xs = let [m, l] = xs
                 ls = S.fromList $ findDivisors l
                 ms = S.fromList $ findDivisors m
              in show . length $ S.intersection ms ls

main :: IO ()
main = do
    getLine
    contents <- getContents
    mapM_ (putStrLn  . process . preProcess) $ lines contents

