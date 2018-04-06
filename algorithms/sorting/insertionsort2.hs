import Insertionsort1 (insert)

insertionSort :: Ord a => [a] -> [a]
insertionSort [x] = [x]
insertionSort (x:xs) = insert x (insertionSort xs)


-- this version get rid of the x
insertionSort' :: Ord a => [a] -> [a]
insertionSort' [] = []
insertionSort' [x] = [x]
insertionSort' (x:xs) = insert $ insertionSort' xs
    where insert [] = [x]
          insert (y:ys)
              | x < y = x : y : ys
              | otherwise = y : insert ys
