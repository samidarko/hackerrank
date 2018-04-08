-- https://www.hackerrank.com/challenges/quicksort1/problem

-- partition p xs = fn xs
--   where 
--     fn [] = []
--     fn (y:ys)
--       | y < p =

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    arr_temp <- getLine
    let arr = map read $ words arr_temp :: [Int]
    putStrLn ""

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret          
