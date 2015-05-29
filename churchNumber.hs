import Control.Arrow

churchNumber :: (Arrow a) => Int -> a b b -> a b b
churchNumber n f = if n == 0 then returnA else f >>> churchNumber (n - 1) f

a = churchNumber 3 (+1) 0

