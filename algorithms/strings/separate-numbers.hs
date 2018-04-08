-- https://www.hackerrank.com/challenges/separate-the-numbers/problem
import qualified Data.List as L

data Result a = YES a | NO deriving (Show, Eq)

-- when is it the end?
isBeautiful :: String -> Int -> Result Int -> Result Int
isBeautiful xs s r
  | null xs = NO
  | s >= (length xs `div` 2) && r == NO = NO -- do we start at 0 or 1? test if r == NO
  | otherwise = let (y, ys) = L.splitAt (s+1) xs
                    i = read y :: Int
                    n = show . succ $ i
                 in if (n == take (length n) ys) && length n == length xs
                       then r
                       else if (n == take (length n) ys) then case r of
                           NO -> isBeautiful xs (s + length n) (YES (succ i))
                           _ -> isBeautiful xs (s + length n) r
                       else isBeautiful xs (s+1) r

