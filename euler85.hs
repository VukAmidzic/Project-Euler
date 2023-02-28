-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------


{-
85. Counting rectangles

By counting carefully it can be seen that a rectangular grid measuring 3 by 2 contains eighteen rectangles.
Although there exists no rectangular grid that contains exactly two million rectangles, find the area of the grid with the nearest solution.
-}

import Data.List
solution = snd $ minimum [(rects,a*b)| a<-[1..100], b<-[1..100],
    let rects = abs (a*(a+1)*(b+1)*b-8000000)]
