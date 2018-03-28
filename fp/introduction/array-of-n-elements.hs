-- https://www.hackerrank.com/challenges/fp-array-of-n-elements/problem
fn n = take n $ repeat 0

main = do
    n <- readLn :: IO Int
    print (fn(n))
