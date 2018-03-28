-- https://www.hackerrank.com/challenges/rotate-string/problem
import Data.List (intercalate)

rotate (x:xs) = let s = xs ++ [x] in s : rotate s

process xs = intercalate " " . take (length xs) . rotate $ xs

main :: IO ()
main = do
  _ <- getLine
  content <- getContents
  mapM_ (putStrLn . process) $ lines content
