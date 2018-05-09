import Data.List
import Control.Monad

rsortByLenght xs = sortBy (\a b -> flip compare (length a) (length b)) xs

process (login, passwords) = fn login passwords (Just [])
  where
    fn [] _ r = r
    fn l [] r = Nothing
    fn l (p:ps) r
      | take p_length l == p = fn (drop p_length l) passwords (r >>= (\xs -> return (xs ++ [p])))
      | otherwise = fn l ps r
      where p_length = length p

preprocess [] = [] 
preprocess xs = let (h, t) = splitAt 3 xs
                    [a, b] = take 2 . drop 1 $ h
                 in (b, rsortByLenght . words $ a) : preprocess t

display Nothing = "WRONG PASSWORD"
display (Just xs) = unwords xs

main :: IO ()
main = do
    getLine
    contents <- getContents
    mapM_ putStrLn $ map (display . process) (preprocess . lines $ contents)
