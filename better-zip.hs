{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances, FunctionalDependencies #-}

class Zip a b | a -> b where
	zip' :: a -> b

instance Zip ([a], [b]) [(a, b)] where
	zip' (as, bs) = zip as bs

instance Zip ([a], [b], [c]) [(a, b, c)] where
	zip' (as, bs, cs) = zip3 as bs cs

a = zip' (['a'..'z'], [0..])
b = zip' (['a'..'z'], [0..], ['x'..'z'])

