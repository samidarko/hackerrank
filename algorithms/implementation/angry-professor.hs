-- https://www.hackerrank.com/challenges/angry-professor/problem
import Control.Monad

main :: IO ()
main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    forM_ [1..t] $ \a0  -> do
        n_temp <- getLine
        let n_t = words n_temp
        let n = read $ n_t!!0 :: Int
        let k = read $ n_t!!1 :: Int
        a_temp <- getLine
        let a = map read $ words a_temp :: [Int]
        putStrLn (if (length $ filter (<=0) a) < k then "YES" else "NO" )

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret          
