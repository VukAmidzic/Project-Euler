-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------


{-
91. Right triangles with integer coordinates

The points P (x1, y1) and Q (x2, y2) are plotted at integer co-ordinates and are joined to the origin, O(0,0), to form ΔOPQ.

There are exactly fourteen triangles containing a right angle that can be formed when each co-ordinate lies between 0 and 2 inclusive; that is,
0 ≤ x1, y1, x2, y2 ≤ 2.

Given that 0 ≤ x1, y1, x2, y2 ≤ 50, how many right triangles can be formed?
-}

isRightTri :: Int -> Int -> Int -> Int -> Bool
isRightTri x1 y1 x2 y2 = 
    let a = x1^2 + y1^2
        b = x2^2 + y2^2
        c = (x1 - x2)^2 + (y1 - y2)^2
    in a + b == c || b + c == a || c + a == b
    
solution = sum [1 | x1 <- [0..50], y1 <- [0..50], x2 <- [0..50], y2 <- [0..50],
    y2 * x1 < y1 * x2 && (isRightTri x1 y1 x2 y2)]
