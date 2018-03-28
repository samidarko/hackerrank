-- https://www.hackerrank.com/challenges/fp-list-length/problem
len :: [a] -> Int
len = foldl (\acc _ -> acc+1) 0

