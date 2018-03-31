-- https://www.hackerrank.com/challenges/weighted-uniform-string/problem
import qualified Data.Map as M
import Data.Maybe (fromJust)

weightMap = M.fromList $ zip ['a'..'z'] [1..]

getWeight c = fromJust $ M.lookup c weightMap

aggregator (m, (c, r)) c' = if c == c' 
                               then let t = r+1; w = t*weight in (M.insert w w m, (c', t)) 
                                        else (M.insert weight weight m, (c', 1))
  where weight = getWeight c'

subsetWeight xs = foldl aggregator (M.empty, ('-', 0)) xs

hasWeight m k = case M.lookup k m of
    Just(_) -> "Yes"
    _ -> "No"


main :: IO ()
main = do
    s <- getLine
    _ <- getLine
    contents <- getContents
    let queries = map read (lines contents) :: [Int]
    let sw = fst . subsetWeight $ s
    let has = hasWeight sw
    mapM_ (putStrLn . has) queries

