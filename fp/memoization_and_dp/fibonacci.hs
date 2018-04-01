-- https://www.hackerrank.com/challenges/fibonacci-fp/problem
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

solution n = (fibs !! i) `mod` (10^8+7)
  where i = read n :: Int

main :: IO ()
main = do
    getLine
    contents <- getContents
    mapM_ (putStrLn . show . solution) $ lines contents
