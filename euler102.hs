-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------

{-
102. Triangle containment

Three distinct points are plotted at random on a Cartesian plane, for which -1000 ≤ x, y ≤ 1000, such that a triangle is formed.

Consider the following two triangles:

A(-340,495), B(-153,-910), C(835,-947)

X(-175,41), Y(-421,-714), Z(574,-645)

It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.

Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file containing the co-ordinates of one thousand "random" triangles, find the number of triangles for which the interior contains the origin.
-}

import Text.Regex 

containsOrig (x1:y1:x2:y2:x3:y3:[])=
    t1*t2>=0 && t3*t4>=0 && t5*t6>=0
    where
    x4 = 0
    y4 = 0
    t1 = (y2-y1)*(x4-x1)+(x1-x2)*(y4-y1)
    t2 = (y2-y1)*(x3-x1)+(x1-x2)*(y3-y1)
    t3 = (y3-y1)*(x4-x1)+(x1-x3)*(y4-y1)
    t4 = (y3-y1)*(x2-x1)+(x1-x3)*(y2-y1)
    t5 = (y3-y2)*(x4-x2)+(x2-x3)*(y4-y2)
    t6 = (y3-y2)*(x1-x2)+(x2-x3)*(y1-y2)
buildTri s = map read (splitRegex (mkRegex ",") s) :: [Integer] 
solution = do
    str <- readFile "triangles.txt"
    print . length . filter (containsOrig) $ map (buildTri) $ lines str
