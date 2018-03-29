-- https://www.hackerrank.com/challenges/subset-sum/problem
import Data.List (sortBy)

strListToIntList = map (read :: String -> Int)
wordsToIntList = strListToIntList . words
linesToIntList = strListToIntList . lines

subsetSum (x:xs) c t s = if t >= s then c else subsetSum xs (c+1) (x+t) s 
subsetSum [] c t s = if t >= s then c else -1

main :: IO ()
main = do
    _ <- getLine
    a_temp <- getLine
    let a = sortBy (flip compare) . wordsToIntList $ a_temp
    _ <- getLine
    contents <- getContents
    let t = linesToIntList contents
    let fn n = subsetSum (tail a) 1 (head a) n
    mapM_ (putStrLn . show . fn) t

