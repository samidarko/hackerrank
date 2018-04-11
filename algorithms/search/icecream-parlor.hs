-- https://www.hackerrank.com/challenges/icecream-parlor/problem
import Control.Monad
import qualified Data.Map as M
import qualified Data.List as L

createMap xs = foldl (\m (v, p) -> M.insert v p m) M.empty xs

process xs m t = foldl fn [] xs
  where fn acc (v, p) = let n = (t-v)
                         in if length acc == 2 
                               then acc
                               else case M.lookup n m of
                                   Just(p') | p == p' -> acc  
                                   Just(p') -> min p p' : max p p' : []  
                                   _ -> acc

display xs = putStrLn . L.intercalate " " . map (show . (+1)) $ xs


main :: IO ()
main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    forM_ [1..t] $ \a0  -> do
        m_temp <- getLine
        let t = read m_temp :: Int
        n_temp <- getLine
        let n = read n_temp :: Int
        arr_temp <- getLine
        let arr = map read $ words arr_temp :: [Int]
        let xs = zip arr [0..]
        let m = createMap xs
        display $ process xs m t
        -- putStrLn ""

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret
