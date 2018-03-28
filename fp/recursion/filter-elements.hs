-- https://www.hackerrank.com/challenges/filter-elements/problem
import Data.List (sort, group)
import qualified Data.Map as M

countValues xs = (M.fromList . map (\x -> (head x, length x)) . group . sort) xs

filterElements [] _ _ = []
filterElements (x:xs) m k = case M.lookup x m of
    Just(v) -> if v >= k 
                  then x : next 
                  else next
    _ -> next
  where
    next = filterElements xs (M.delete x m) k


process [] = []
process (a:b:xs) = let k = read (words a !! 1) :: Int
                       ys = map (\i -> read i :: Int) (words b)
                    in filterElements ys (countValues ys) k : process xs


main :: IO ()
main = do
  _ <- getLine
  content <- getContents
  let result = process $ lines content
  mapM_ (\x -> putStrLn (if null x then "-1" else unwords (map show x))) result
