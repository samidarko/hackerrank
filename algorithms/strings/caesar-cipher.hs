-- https://www.hackerrank.com/challenges/caesar-cipher-1/problem
import Data.Char (toLower, toUpper, isAlpha, isUpper)
import Data.Maybe (fromJust)
import qualified Data.Map as M

alpha = ['a'..'z']
alphaLength = length alpha
alphaMap = M.fromList $ zip alpha [0..]

findIndex c = case M.lookup c alphaMap of
    Just(i) -> i
    _ -> error "index not found"


cypher k c
  | not . isAlpha $ c = c
  | otherwise = let i = findIndex c'
                    n = (i + k) `mod` alphaLength
                 in if isUpper c then toUpper $ alpha !! n else alpha !! n
  where
    c' = toLower c

main :: IO ()
main = do
    _ <- getLine
    s <- getLine
    k <- readLn :: IO Int
    let fn = cypher k
    putStrLn $ map fn s
