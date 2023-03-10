-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------


{-
99. Large non-Mersenne prime

Comparing two numbers written in index form like 211 and 37 is not difficult, as any calculator would confirm that 211 = 2048 < 37 = 2187.

However, confirming that 632382^518061 > 519432^525806 would be much more difficult, as both numbers contain over three million digits.

Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file containing one thousand lines with a base/exponent pair on each line, determine which line number has the greatest numerical value.

-}

import Data.List

lognum (b,e) = e * log b
logfun x = lognum . read $ "(" ++ x ++ ")"

solution = do
    str <- readFile "base_exp.txt"
    print $ snd . maximum . flip zip [1..] . map logfun $ lines str
