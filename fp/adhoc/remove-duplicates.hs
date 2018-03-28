
removeDuplicates = reverse . foldl (\acc v -> if v `elem` acc then acc else v:acc) []
-- removeDuplicates = foldl (\acc v -> if v `elem` acc then acc else acc ++ [v]) []

main :: IO ()
main = do
    getLine >>= putStrLn . removeDuplicates
