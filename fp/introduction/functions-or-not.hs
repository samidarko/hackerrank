import qualified Data.Map as M

lineToIntList l = map read $ words l :: [Int]

tuplify (a:b:_) = (a, b)

processLine = tuplify . lineToIntList

isFunction [] m = True
isFunction ((a,b):xs) m = case M.lookup a m of
                            Just(v) -> if v == b then isFunction xs m else False
                            _ -> isFunction xs (M.insert a b m)

caseByCase 0 = return ()
caseByCase t = do
  n <- readLn :: IO Int
  pairs <- readMultipleLines n
  putStrLn $ if isFunction pairs M.empty then "YES" else "NO"
  caseByCase (t-1)

readMultipleLines :: Int -> IO [(Int, Int)]
readMultipleLines 0 = return []
readMultipleLines n = do
    line <- getLine
    rest <- readMultipleLines(n - 1)
    return (processLine line : rest)

main :: IO ()
main = do
  t <- readLn :: IO Int
  caseByCase t
