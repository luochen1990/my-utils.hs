{-# LANGUAGE FlexibleInstances, OverlappingInstances #-}

import Data.Monoid
import Control.Monad

--type Lifter m a = (Monad m) => (a -> m a)

instance Monad m => Monoid (a -> m a) where
	mempty = return
	mappend = (>=>)

