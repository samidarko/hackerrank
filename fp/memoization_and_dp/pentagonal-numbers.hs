-- https://www.hackerrank.com/challenges/pentagonal-numbers/problem
pentagonal n = truncate $ (3 * n**2 - n) / 2

main :: IO ()
main = do
  _ <- getLine
  contents <- getContents
  let xs = map (read :: String -> Double) $ lines contents
  mapM_ (putStrLn . show . pentagonal) xs
