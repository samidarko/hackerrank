-- https://www.hackerrank.com/challenges/string-reductions/problem
reduceString xs = fn xs ""
  where
    fn (y:ys) s = if y `elem` s then fn ys s else y : fn ys (y:s)
    fn [] _ = []

main :: IO ()
main = do
  l <- getLine
  putStrLn $ reduceString l
