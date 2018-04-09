-- https://www.hackerrank.com/challenges/quicksort1/problem
import Data.List (intercalate)

aggregator v (lt, eq, gt) = let p = head eq
                             in if v < p then (v:lt, eq, gt)
                                         else if v > p then (lt, eq, v:gt)
                                         else (lt, v:eq, gt)

partition xs = let (lt, eq, gt) = foldr aggregator ([], [head xs], []) (tail xs)
                in (lt ++ eq ++ gt)

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    arr_temp <- getLine
    let arr = map read $ words arr_temp :: [Int]
    putStrLn . intercalate " " .  map show $ partition arr

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        let ret = (x:xs)
        return ret
