-- https://www.hackerrank.com/challenges/sequence-full-of-colors/problem

data Record = Record { r :: Int, g :: Int, y :: Int, b :: Int } deriving Show

process record [] = if r record == g record && y record == b record then True else False
process record (x:xs) 
  | x == 'R' || x == 'G' = if abs ( r record' - g record' ) > 1 then False else process record' xs
  | otherwise = if abs ( y record' - b record' ) > 1 then False else process record' xs
  where record' = updateRecord x record


updateRecord 'R' record = record { r = r record + 1 }
updateRecord 'G' record = record { g = g record + 1 }
updateRecord 'Y' record = record { y = y record + 1 }
updateRecord 'B' record = record { b = b record + 1 }


singleton = Record 0 0 0 0

main :: IO ()
main = do
    getLine
    getContents >>= putStrLn . unlines . map (show . process singleton) . words
