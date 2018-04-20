-- https://www.hackerrank.com/challenges/divisible-sum-pairs/problem

main :: IO ()
main = do
    n_temp <- getLine
    let n_t = words n_temp
    let n = read $ n_t!!0 :: Int
    let k = read $ n_t!!1 :: Int
    ar_temp <- getLine
    let arr = map read $ words ar_temp :: [Int]
    let indices = [0..length arr-1]
    print $ length [ (i, j) | i <- indices, j <- indices, i < j, let x = arr !! i, let y = arr !! j, (x+y) `mod` k == 0]

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret  
