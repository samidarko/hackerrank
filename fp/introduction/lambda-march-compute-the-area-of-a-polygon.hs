-- https://www.hackerrank.com/challenges/lambda-march-compute-the-area-of-a-polygon/problem

data Point = Point { x :: Double, y :: Double } deriving Show

processInput = map (toPoint . words)

strToDouble = read :: String -> Double

area ps = abs $ 0.5 * sum [ fn j | j <- [0..length ps-1]]
  where
    fn i = x (getPoint i) * y (getPoint (i+1)) - x (getPoint (i+1)) * y (getPoint i) 
    getPoint k = ps !! (if k < length ps then k else k - length ps)

toPoint :: [String] -> Point
toPoint [x,y] = Point (strToDouble x) (strToDouble y)

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        let ret = (x:xs)
        return ret

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    points <- getMultipleLines n
    print . area . processInput $ points

