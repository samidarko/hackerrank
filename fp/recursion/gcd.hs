-- https://www.hackerrank.com/challenges/functional-programming-warmups-in-recursion---gcd/problem
gcd' :: Integral a => a -> a -> a
gcd' n m = -- Complete this function


-- This part is related to the Input/Output and can be used as it is
-- Do not modify it
main = do
  input <- getLine
  print . uncurry gcd' . listToTuple . convertToInt . words $ input
 where
  listToTuple (x:xs:_) = (x,xs)
  convertToInt = map (read :: String -> Int)
