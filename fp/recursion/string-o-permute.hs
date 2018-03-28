-- https://www.hackerrank.com/challenges/string-o-permute/problem

permute (a:b:xs) = b:a:permute xs
permute [] = []

main :: IO ()
main = do
  _ <- getLine
  content <- getContents
  mapM_ (putStrLn . permute) (lines content)

