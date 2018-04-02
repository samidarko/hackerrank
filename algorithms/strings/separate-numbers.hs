-- https://www.hackerrank.com/challenges/separate-the-numbers/problem

data Result a = YES a | NO deriving Show

-- when is it the end?
isBeautiful :: String -> Int -> Result Int -> Result Int
isBeautiful xs s r
  | null xs = NO
  | s >= (length xs `div` 2) = NO -- do we start at 0 or 1?
  | otherwise = let (y:ys) = splitAt (s+1) xs
                    i = read "1" :: Int
                    n = show . succ $ i
                 in if n == take (length n) ys 
                       then case r of
                           NO -> isBeautiful xs (s + length n) (YES n)
                           _ -> isBeautiful xs (s + length n) r
                       else isBeautiful xs (s+1) r
