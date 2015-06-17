primes :: [Integer]
primes = 2: 3: sieve (tail primes) [5, 7..] where
	sieve (p: ps) xs = h ++ sieve ps [x | x <- t, rem x p /= 0]
		where (h, ~(_: t)) = span(< p * p) xs

main = do
	print $ last $ takeWhile (< 10000000) $ primes

{-
9999991
  33,611,319,472 bytes allocated in the heap
  10,139,484,696 bytes copied during GC
      47,813,384 bytes maximum residency (245 sample(s))
         884,488 bytes maximum slop
             140 MB total memory in use (0 MB lost due to fragmentation)

                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0     64188 colls,     0 par    3.59s    3.87s     0.0001s    0.0016s
  Gen  1       245 colls,     0 par    2.34s    2.21s     0.0090s    0.0222s

  INIT    time    0.00s  (  0.01s elapsed)
  MUT     time   11.93s  ( 11.86s elapsed)
  GC      time    5.93s  (  6.08s elapsed)
  RP      time    0.00s  (  0.00s elapsed)
  PROF    time    0.00s  (  0.00s elapsed)
  EXIT    time    0.00s  (  0.01s elapsed)
  Total   time   17.86s  ( 17.96s elapsed)

  %GC     time      33.2%  (33.9% elapsed)

  Alloc rate    2,816,415,620 bytes per MUT second

  Productivity  66.8% of total user, 66.4% of total elapsed
-}
