-- https://www.hackerrank.com/challenges/captain-prime/problem
import Data.Char (digitToInt)

data FATE = CENTRAL | LEFT | RIGHT | DEAD deriving Show

iSqrt = floor . sqrt . fromIntegral

isPrime 1 = False
isPrime k = null [ x | x <- [2..iSqrt k], k `mod`x  == 0]

side fn (x:[]) = isPrime $ digitToInt x
side fn xs = if (isPrime $ (read xs :: Int)) then side fn (fn xs) else False

right xs = side init xs

left xs = side tail xs

personFate xs
  | "0" == xs = DEAD
  | '0' `elem` xs = DEAD
  | length xs == 1 = if (isPrime $ (read xs :: Int)) then CENTRAL else DEAD
  | not . isPrime $ (read xs :: Int) = DEAD
  | otherwise = fn (left (tail xs)) (right (init xs))
  where
    fn True True   = CENTRAL
    fn True False  = LEFT
    fn False True  = RIGHT
    fn False False = DEAD


main :: IO ()
main = do
  _ <- getLine
  contents <- getContents
  mapM_ (putStrLn . show . personFate) $ lines contents
