-- https://www.hackerrank.com/challenges/circular-array-rotation/problem

-- rotate 0 xs = xs 
-- rotate n xs = rotate (n-1) (last xs : init xs)

rotate n xs = let (y, z) = splitAt (length xs - n) xs in (z ++ y)

main :: IO ()
main = do
    n_temp <- getLine
    let n_t = words n_temp
    let n = read $ n_t!!0 :: Int
    let k = read $ n_t!!1 :: Int
    let q = read $ n_t!!2 :: Int
    a_temp <- getLine
    let a = map read $ words a_temp :: [Int]
    m_temp <- getMultipleLines q
    let m = map (read :: String -> Int) m_temp
    let r = rotate (k `mod` length a) a
    mapM_ (print . (!!) r)  m

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        let ret = (x:xs)
        return ret
