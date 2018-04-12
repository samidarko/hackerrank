-- https://www.hackerrank.com/challenges/beautiful-days-at-the-movies/problem

isBeautiful n k = (n - read (reverse $ show n) :: Int) `mod` k == 0

main :: IO ()
main = do
    i_temp <- getLine
    let i_t = words i_temp
    let i = read $ i_t!!0 :: Int
    let j = read $ i_t!!1 :: Int
    let k = read $ i_t!!2 :: Int
    print $ foldl (\acc v -> if isBeautiful v k then acc+1 else acc) 0 [i..j]

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret          

