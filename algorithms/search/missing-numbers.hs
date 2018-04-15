import qualified Data.Map as M
import qualified Data.Set as S

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
    let sa = S.fromList ma
    let mb = createMap brr
    let sb = S.fromList mb
    let common = S.intersection sa sb
    putStrLn ""

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret          

