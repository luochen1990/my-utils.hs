{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances, FunctionalDependencies #-}

class CartProd a b | a -> b where
	cartProd :: a -> b

instance CartProd ([a], [b]) [(a, b)] where
	cartProd (as, bs) = [(a, b) | a <- as, b <- bs]

instance CartProd ([a], [b], [c]) [(a, b, c)] where
	cartProd (as, bs, cs) = [(a, b, c) | a <- as, b <- bs, c <- cs]

c = cartProd (['a'..'c'], [0..2])
d = cartProd (['a'..'c'], [0..2], ['x'..'z'])

