-- https://www.hackerrank.com/challenges/fp-sum-of-odd-elements/problem
f = sum . filter odd

toListOfInt xs = map read $ lines xs :: [Int]

main = do
   inputdata <- getContents
   print . f . toListOfInt $ inputdata
