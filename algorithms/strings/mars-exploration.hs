-- https://www.hackerrank.com/challenges/mars-exploration/problem
main :: IO ()
main = do
    getLine >>= print . foldl (\acc (e, a) -> if (e == a) then acc else acc + 1 ) 0 . zip (cycle "SOS")
