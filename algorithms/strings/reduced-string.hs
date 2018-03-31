-- https://www.hackerrank.com/challenges/reduced-string/problem

reduceString [] = []
reduceString (x:[]) = (x:[])
reduceString (x:y:ys) 
  | x == y = ys
  | otherwise = x : reduceString (y:ys)

processString s = let s' = reduceString s
                   in if length s > length s' then processString s' else s'

outputFormat [] = "Empty String"
outputFormat s = s

main :: IO ()
main = do
    getLine >>= putStrLn . outputFormat . processString

