-- https://www.hackerrank.com/challenges/string-mingling/problem

main :: IO ()
main = do
  p <- getLine
  q <- getLine
  putStrLn $ foldr (\(a, b) acc -> a:b:acc) [] $ zip p q
