-- https://www.hackerrank.com/challenges/lambda-march-compute-the-perimeter-of-a-polygon/problem
import System.IO

processInput = map (tuplintfy . words)

strToDouble = read :: String -> Double

dist (x1, y1) (x2, y2) = sqrt ( (x1 - x2)^2 + (y1 - y2)^2 )

perimeter coords@(p:_) = fn coords
    where fn (p1:p2:[]) = dist p1 p2 + dist p2 p
          fn (p1:p2:ps) = dist p1 p2 + fn (p2:ps)

tuplintfy :: [String] -> (Double, Double)
tuplintfy [x,y] = (strToDouble x, strToDouble y)

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    l <- getMultipleLines n
    putStrLn $ (show . perimeter . processInput) l

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        let ret = (x:xs)
        return ret

