isPrime :: Integer -> Bool
primes :: [Integer]

isPrime x = all ((/= 0) . (x `mod`)) $ takeWhile ((<= x) . (^ 2)) primes
primes = 2 : filter isPrime [3..]

primePairs = filter (\(a, b) -> a + 2 == b) $ zip primes (tail primes)

main :: IO()
main = do
	print $ last $ takeWhile (< 10000000) $ primes

{-
9999991
  45,472,465,688 bytes allocated in the heap
     135,924,744 bytes copied during GC
      31,660,008 bytes maximum residency (8 sample(s))
         619,632 bytes maximum slop
              63 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0     87566 colls,     0 par    0.28s    0.28s     0.0000s    0.0002s
  Gen  1         8 colls,     0 par    0.05s    0.05s     0.0064s    0.0226s

  INIT    time    0.00s  (  0.00s elapsed)
  MUT     time   18.47s  ( 18.53s elapsed)
  GC      time    0.33s  (  0.34s elapsed)
  RP      time    0.00s  (  0.00s elapsed)
  PROF    time    0.00s  (  0.00s elapsed)
  EXIT    time    0.00s  (  0.01s elapsed)
  Total   time   18.80s  ( 18.87s elapsed)

  %GC     time       1.7%  (1.8% elapsed)

  Alloc rate    2,461,894,393 bytes per MUT second

  Productivity  98.3% of total user, 97.9% of total elapsed
-}
