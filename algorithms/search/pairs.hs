-- https://www.hackerrank.com/challenges/pairs/problem
import qualified Data.Set as S

main :: IO ()
main = do
    n_temp <- getLine
    let n_t = words n_temp
    let n = read $ n_t!!0 :: Int
    let k = read $ n_t!!1 :: Int
    arr_temp <- getLine
    let arr = map read $ words arr_temp :: [Int]
    print . length $ S.intersection (S.fromList arr) (S.fromList $ map (+k) arr)

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        let ret = (x:xs)
        return ret
