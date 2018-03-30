-- https://www.hackerrank.com/challenges/pangrams/problem
import qualified Data.Char as C
import qualified Data.Set as S

sanitize xs = foldl (\acc c -> if C.isAlpha c then C.toLower c : acc else acc) [] xs

isPangram s = if 26 == (length . S.fromList . sanitize $ s) then "pangram" else "not pangram"

testString = "We promptly judged antique ivory buckles for the next prize"

main :: IO ()
main = do
    getLine >>= putStrLn . isPangram

-- "We promptly judged antique ivory buckles for the next prize" => "pangram"
