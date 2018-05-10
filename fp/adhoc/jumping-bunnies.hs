-- https://www.hackerrank.com/challenges/jumping-bunnies/problem

main :: IO ()
main = do
  getLine
  a <- getLine
  let bunnies = map read (words a) :: [Int]
  print $ foldl1 lcm bunnies
