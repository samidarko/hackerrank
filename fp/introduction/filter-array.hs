-- https://www.hackerrank.com/challenges/fp-filter-array/problem
fn :: Int -> [Int] -> [Int]
fn n (x:xs) = if (x < n) then x : fn n xs else  fn n xs
fn _ [] = []

main = do 
    n <- readLn :: IO Int 
    inputdata <- getContents 
    let numbers = map read (lines inputdata) :: [Int] 
    putStrLn . unlines $ (map show . fn n) numbers

