-- https://www.hackerrank.com/challenges/closest-numbers/problem
import qualified Data.List as L

format (x, y) = show x ++ " " ++ show y

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    arr_temp <- getLine
    let l = L.sort $ map read $ words arr_temp :: [Int]
    let temp = map (\(x, y) -> ((x, y), abs $ x - y )) $ zip l (tail l)
    let m = snd . L.minimumBy (\x y -> snd x `compare` snd y) $ temp
    putStrLn $ foldl (\acc (p, v) -> if v == m then acc ++ format p ++ " " else acc) "" temp
