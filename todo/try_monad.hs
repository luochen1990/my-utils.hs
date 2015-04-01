{-# LANGUAGE FlexibleInstances, OverlappingInstances #-}

import Data.List
import Data.Monoid
import Control.Monad
--{-# LANGUAGE RankNTypes #-}
--
--import Data.Monoid
--import Control.Monad

--newtype Length = Length Int
--	deriving (Show, Read, Eq, Ord, Num)
--
----instance Monad Length where
----	return :: String -> Length
----	return s = Length (length s)
----	
----	>>= :: Length -> (String -> Length) -> Length -- f LIKE length . (++ s) 
----	(Length len) >>= f =
--
----instance Monoid Length where
----	mempty = Length []
----	(Length a) `mappend` (Length b) = Length (length a + length b)
--
--
----class (Monoid a, b) => Homomorphism (a, b) where
----	hmap :: a -> b
----	hcombinate :: a -> a -> b
----	hcombinate x y = hmap x <> hmap y
----	mmap $ x <> y = mmap x <> mmap y
----
----instance Homomorphism (Concat, Plus) where
----
--class (Monoid a) => HomomorphismMonoid b where
--	hmempty :: b
--	hmap :: a -> b
--	hcombine :: b -> b -> (a -> a -> b) -> a
--	hcombine x y f = f (hmap x) (hmap y)
--	--hcombine x y f = f `on` hmap $ x y
--
--
--instance HomomorphismMonoid Length where
--	hmempty = Length 0
--	hmap s = Length (length s)
--	--hcombine = 

--instance Monad m => Monoid (a -> m a) where
--	mempty = return
--	mappend = (>=>)

instance Monad m => Monoid (a -> m b) where
	mempty = return
	mappend = (>=>)

