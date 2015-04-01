{-# LANGUAGE FlexibleInstances, OverlappingInstances, ScopedTypeVariables, UndecidableInstances #-} --, RankNTypes #-}

import Data.List
import Data.Monoid
import Control.Monad

class (Monoid a) => Fastfoldable a where
	mpow :: a -> Int -> a
	mpow x n = rec x n (mempty :: a) where
		rec :: a -> Int -> a -> a
		rec x n r = if n == 0 then r else rec (x <> x) n' r' where
			n' = div n 2
			r' = if n' * 2 == n then r else (r <> x)

instance (Monoid a) => Fastfoldable a

--mpow :: (Monoid a) => a -> Int -> a
--mpow x n = rec x n (mempty :: a) where
--	rec :: a -> Int -> a -> a
--	rec x n r = if n == 0 then r else rec (x <> x) n' r' where
--		n' = div n 2
--		r' = if n' * 2 == n then r else (r <> x)
