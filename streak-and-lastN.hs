module Streak (streak, streak', lastN) where

import Data.List (tails)

streak n = takeWhile ((== n) . length) . map (take n) . tails

streak' n xs = streak n $ xs ++ take (n - 1) xs

lastN n = last . streak n

