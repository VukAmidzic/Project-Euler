-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------


{-
53. Combinatoric selections

There are exactly ten ways of selecting three from five, 12345:

123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

In combinatorics, we use the notation: (5 3) = 10 --> five over three

In general, (n r) = n! / r! * (n -r)!, for r <= n

It is not until (23 10) that a value exceeds one-million: 1144066

How many, not necessarily distinct, values of (n r) for 1 <= n <= 100, are greater than one-million?
-}

fact = scanl (*) 1 [1..100]
comb (r,n) = fact!!n `div` (fact!!r * fact!!(n-r))
perms = [(n,x) | x<-[1..100], n<-[1..x]]

solution = length $ filter (>1000000) $ map comb $ perms
