
insert :: Int -> [Int] -> [Int]
insert n xs = fn xs
  where 
    fn ys
      | null ys = [n]
      | last_ys < n = ys ++ [n]
      | otherwise = fn (init ys) ++ [last_ys]
      where last_ys = last ys

