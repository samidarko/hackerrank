-- https://www.hackerrank.com/challenges/fp-hello-world-n-times/problem
import System.IO

main :: IO ()
main = do
    n_temp <- getLine
    let n = read n_temp :: Int
    mapM_ (\_ -> putStrLn "Hello World") [0..n-1]
