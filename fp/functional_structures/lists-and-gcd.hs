-- https://www.hackerrank.com/challenges/lists-and-gcd/problem
import qualified Data.Map as M
import qualified Data.Set as S
import Data.List (sortOn, intercalate)
import Data.Maybe (fromJust)

primesMap xs = fn xs M.empty
  where 
    fn (x:y:ys) m
      | null ys = m'
      | otherwise = fn ys m'
      where m' = M.insert x y m

process xs = foldl fn (primesMap $ head xs) (tail xs)
  where fn acc v = let m = primesMap v
                    in foldl (\acc' v' -> case M.lookup v' m of Just(w) -> M.insert v' (min w (fromJust $ M.lookup v' acc')) acc'; _ -> M.delete v' acc') acc (M.keys acc)

main :: IO ()
main = do
  getLine
  contents <- getContents
  putStrLn . intercalate " " . map show . foldr (\(a, b) acc -> a:b:acc) []  . sortOn fst . M.toList . process $ map (map (read :: String -> Int) . words) $ lines contents
