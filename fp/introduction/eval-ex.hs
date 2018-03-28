import Control.Monad
import System.IO

fact n = product [1..n]
e x = [x**y/ fact y | y <- [0..]]

process = sum . take 10 . e

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    l <- getMultipleLines n
    forM_ l $ \i -> do
        putStrLn $ (show . process . read) i


getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        let ret = (x:xs)
        return ret

