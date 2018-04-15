

powers x n = [ y^n | y <- [1..truncate $ fromIntegral x**(1 / fromIntegral n)]]

l = powers 100 2


-- sum xs current target
