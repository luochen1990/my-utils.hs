import Control.Monad
import Data.Char (isSpace)
import Data.List (dropWhileEnd, intercalate)

charArt :: (String, String) -> (Int, Int) -> ((Int, Int) -> String) -> String
charArt (ir, ic) (nr, nc) f = intercalate ir . map (dropWhileEnd isSpace . intercalate ic) $ ls where
	ls = [[f (i, j) | j <- [0..nc-1]] | i <- [0..nr-1]]

circle r (i, j) = if h (i, j) then "#" else "_" where
	h (i', j') = i ^ 2 + j ^ 2 < r ^ 2 where
		(i, j, r) = (i' - r, j' - r, 10)

triangle n (i, j) = if i + j >= n - 1 && i < n && j < n then "#" else "_"

main = do
	putStrLn $ charArt ("\n", " ") (20, 20) (circle 10)
	putStrLn $ charArt ("\n", " ") (15, 15) (triangle 10)

