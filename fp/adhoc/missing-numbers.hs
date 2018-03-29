-- https://www.hackerrank.com/challenges/missing-numbers-fp/problem
import qualified Data.IntMap.Strict as M
import qualified Data.List as L

strToIntList = map (read :: String -> Int) . words

createMap xs = foldl (\m v -> M.insertWith (+) v 1 m) M.empty xs

createMapFromString = createMap . strToIntList

findExtraNumbers bs as = M.differenceWith (\b a -> let c = b - a in if c <= 0 then Nothing else Just c ) bs as

fromMapToString =  L.intercalate " " . map show .  L.sort . map fst . M.toList

main :: IO ()
main = do
  _ <- getLine
  as_temp <- getLine
  _ <- getLine
  bs_temp <- getLine
  let as = createMapFromString as_temp
  let bs = createMapFromString bs_temp
  putStrLn . fromMapToString $ findExtraNumbers bs as

