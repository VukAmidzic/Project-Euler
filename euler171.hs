-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------


{-
171. Finding numbers for which the sum of the squares of the digits is a square

For a positive integer n, let f(n) be the sum of the squares of the digits (in base 10) of n, e.g.

f(3) = 3^2 = 9,
f(25) = 2^2 + 5^2 = 4 + 25 = 29,
f(442) = 4^2 + 4^2 + 2^2 = 16 + 16 + 4 = 36

Find the last nine digits of the sum of all n, 0 < n < 10^20, such that f(n) is a perfect square.
-}

num_digits :: Integral x => x -> [x]
num_digits 0 = []
num_digits x = num_digits (div x 10) ++ [mod x 10]

is_square =
  let check n = sq * sq == n
        where sq = floor $ sqrt $ (fromIntegral n :: Double)
  in (map check [0..] !!)
  
f :: Int -> Int 
f n = foldr (+) 0 (map (\i -> i * i) (num_digits n))

sums = map (\n -> div (n * (n + 1)) 2) [15000..10^20]

filter_sums = filter (is_square . f) sums

fst_perfect = mod (head $ filter_sums) d
    where d = 10^9
