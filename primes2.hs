isPrime :: Integer -> Bool
primes :: [Integer]

isPrime x = all ((/= 0) . (x `mod`)) $ takeWhile ((< x) . (^ 2)) primes
primes = 2 : filter isPrime [3..]

main :: IO()
main = do
	print $ last $ takeWhile (< 10000000) $ primes

{-
9999991
  48,073,438,968 bytes allocated in the heap
     137,160,664 bytes copied during GC
      31,530,624 bytes maximum residency (8 sample(s))
         620,400 bytes maximum slop
              63 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0     92577 colls,     0 par    0.16s    0.27s     0.0000s    0.0005s
  Gen  1         8 colls,     0 par    0.05s    0.05s     0.0060s    0.0196s

  INIT    time    0.00s  (  0.01s elapsed)
  MUT     time   18.97s  ( 18.89s elapsed)
  GC      time    0.20s  (  0.32s elapsed)
  RP      time    0.00s  (  0.00s elapsed)
  PROF    time    0.00s  (  0.00s elapsed)
  EXIT    time    0.00s  (  0.01s elapsed)
  Total   time   19.17s  ( 19.22s elapsed)

  %GC     time       1.1%  (1.7% elapsed)

  Alloc rate    2,534,219,530 bytes per MUT second

  Productivity  98.9% of total user, 98.7% of total elapsed
-}
