-- https://www.hackerrank.com/challenges/string-compression/problem

import Data.List

compress s@(x:xs) = let l = length s
                     in if l == 1 then s else x:(show l)
                     
main :: IO ()
main = do
  s <- getLine
  putStrLn (concat $ map compress $ group s)

