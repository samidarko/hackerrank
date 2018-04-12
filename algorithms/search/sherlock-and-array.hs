-- https://www.hackerrank.com/challenges/sherlock-and-array/problem
import Control.Monad

process xs = foldl (\(l, n,  r) v -> if l == r then (l, n, r) else (l+n, v,  r-v)) (0, head xs, sum $ drop 1 xs) (tail xs)

display (l, _, r) = if l == r then "YES" else "NO"

main :: IO ()
main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    forM_ [1..t] $ \a0  -> do
        n_temp <- getLine
        let n = read n_temp :: Int
        a_temp <- getLine
        let arr = map read $ words a_temp :: [Int]
        putStrLn $ display $ process arr


getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret          
