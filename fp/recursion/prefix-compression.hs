-- https://www.hackerrank.com/challenges/prefix-compression/problem

findPrefix _ [] = ""
findPrefix [] _ = ""
findPrefix (x:xs) (y:ys) = if x == y then x: findPrefix xs ys else []

main :: IO ()
main = do
  x <- getLine
  y <- getLine
  let p = findPrefix x y
  let pLength = length p
  let x' = drop pLength x
  let y' = drop pLength y
  putStrLn (show pLength ++ " " ++ p)
  putStrLn (show (length x') ++ " " ++ x')
  putStrLn (show (length y') ++ " " ++ y')
