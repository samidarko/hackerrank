-- https://www.hackerrank.com/challenges/fp-filter-positions-in-a-list/problem
removeOddPositions l = foldr fn [] $ zip [0..] l
    where fn (p, v) acc = if odd p then v:acc else acc

main :: IO ()
main = do
    content <- getContents
    let xs = map read (lines $ content ) :: [Int]
    mapM_ (putStrLn. show) $ removeOddPositions xs

