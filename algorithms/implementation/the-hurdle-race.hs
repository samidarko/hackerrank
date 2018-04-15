-- https://www.hackerrank.com/challenges/the-hurdle-race/problem

main :: IO ()
main = do
    n_temp <- getLine
    let n_t = words n_temp
    let n = read $ n_t!!0 :: Int
    let k = read $ n_t!!1 :: Int
    height_temp <- getLine
    let height = map read $ words height_temp :: [Int]
    let maxHeight = maximum height
    print (if maxHeight <= k then 0 else maxHeight - k)

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret  
