-- https://www.hackerrank.com/challenges/missing-numbers/problem
import qualified Data.Map as M
import qualified Data.Set as S
import Data.List (sort, intercalate)
import Data.Maybe (isJust)

createMap xs = foldl (\m v -> M.insertWith (+) v 1 m) M.empty xs

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    arr_temp <- getLine
    let arr = map read $ words arr_temp :: [Int]
    m_temp <- getLine
    let m = read m_temp :: Int
    brr_temp <- getLine
    let brr = map read $ words brr_temp :: [Int]
    let ma = createMap arr
    let sa = S.fromList $ M.keys ma
    let mb = createMap brr
    let sb = S.fromList $ M.keys mb
    let helper x = M.lookup x ma >>= (\y -> if y < 2 then Nothing else M.lookup x mb >>= (\z -> if y == z then Nothing else Just x))
    let common = S.intersection sa sb
    let result = intercalate " " . map show . sort . S.toList $ S.filter (isJust . helper) common
    putStrLn result

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret          

