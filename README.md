		                 
This is a small script to benchmark different S3 providers

1. Run `make create_files`
2. Copy `.envrc-example` to `.envrc`
3. Run `direnv allow`
4. Run `make run`

If you run those on a specific ISP, send a Pull Requests with results

* AWS: fastest and very consistent
* Google: slightly slower than S3
* Scaleway: much slower, and massive standard deviation

From Orange ISP

	aws 0 B                          median: 50ms, min: 40ms, max: 68ms, standard_deviation: 10.16
	google 0 B                       median: 116ms, min: 94ms, max: 399ms, standard_deviation: 91.105
	scaleway 0 B                     median: 460ms, min: 257ms, max: 991ms, standard_deviation: 268.788
	
	aws 1 KiB                        median: 55ms, min: 52ms, max: 84ms, standard_deviation: 11.321
	google 1 KiB                     median: 191ms, min: 84ms, max: 397ms, standard_deviation: 117.533
	scaleway 1 KiB                   median: 889ms, min: 294ms, max: 1401ms, standard_deviation: 398.709
	
	aws 10 KiB                       median: 69ms, min: 52ms, max: 92ms, standard_deviation: 14.781
	google 10 KiB                    median: 117ms, min: 76ms, max: 137ms, standard_deviation: 18.222
	scaleway 10 KiB                  median: 1005ms, min: 253ms, max: 1546ms, standard_deviation: 374.525
	
	aws 100 KiB                      median: 85ms, min: 66ms, max: 152ms, standard_deviation: 25.718
	google 100 KiB                   median: 115ms, min: 104ms, max: 159ms, standard_deviation: 16.844
	scaleway 100 KiB                 median: 765ms, min: 283ms, max: 1326ms, standard_deviation: 354.788
	
	aws 1 MiB                        median: 213ms, min: 173ms, max: 237ms, standard_deviation: 17.428
	google 1 MiB                     median: 186ms, min: 170ms, max: 209ms, standard_deviation: 15.069
	scaleway 1 MiB                   median: 996ms, min: 373ms, max: 1782ms, standard_deviation: 421.796
	
	aws 10 MiB                       median: 479ms, min: 459ms, max: 566ms, standard_deviation: 35.867
	google 10 MiB                    median: 450ms, min: 416ms, max: 863ms, standard_deviation: 174.404
	scaleway 10 MiB                  median: 947ms, min: 529ms, max: 2623ms, standard_deviation: 670.275
	
	aws 100 MiB                      median: 2099ms, min: 1728ms, max: 2665ms, standard_deviation: 337.487
	google 100 MiB                   median: 2007ms, min: 1725ms, max: 2864ms, standard_deviation: 483.31
	scaleway 100 MiB                 median: 4644ms, min: 2475ms, max: 9218ms, standard_deviation: 2114.602

From Scaleway ISP

	aws 0 B                          median: 39ms, min: 32ms, max: 50ms, standard_deviation: 5.439
	google 0 B                       median: 95ms, min: 71ms, max: 161ms, standard_deviation: 26.153
	scaleway 0 B                     median: 528ms, min: 314ms, max: 1371ms, standard_deviation: 329.821
	
	aws 1 KiB                        median: 48ms, min: 31ms, max: 76ms, standard_deviation: 14.491
	google 1 KiB                     median: 97ms, min: 80ms, max: 133ms, standard_deviation: 14.684
	scaleway 1 KiB                   median: 1294ms, min: 282ms, max: 1978ms, standard_deviation: 506.517
	
	aws 10 KiB                       median: 50ms, min: 38ms, max: 95ms, standard_deviation: 17.406
	google 10 KiB                    median: 93ms, min: 83ms, max: 112ms, standard_deviation: 9.419
	scaleway 10 KiB                  median: 844ms, min: 307ms, max: 1448ms, standard_deviation: 387.777
	
	aws 100 KiB                      median: 49ms, min: 39ms, max: 109ms, standard_deviation: 22.629
	google 100 KiB                   median: 113ms, min: 89ms, max: 193ms, standard_deviation: 30.872
	scaleway 100 KiB                 median: 1236ms, min: 310ms, max: 2358ms, standard_deviation: 734.676
	
	aws 1 MiB                        median: 132ms, min: 111ms, max: 152ms, standard_deviation: 12.917
	google 1 MiB                     median: 116ms, min: 106ms, max: 182ms, standard_deviation: 27.991
	scaleway 1 MiB                   median: 601ms, min: 235ms, max: 2036ms, standard_deviation: 507.563
	
	aws 10 MiB                       median: 261ms, min: 220ms, max: 329ms, standard_deviation: 30.524
	google 10 MiB                    median: 259ms, min: 237ms, max: 376ms, standard_deviation: 50.975
	scaleway 10 MiB                  median: 964ms, min: 393ms, max: 1349ms, standard_deviation: 283.44
	
	aws 100 MiB                      median: 1048ms, min: 942ms, max: 1361ms, standard_deviation: 115.588
	google 100 MiB                   median: 1358ms, min: 1055ms, max: 1655ms, standard_deviation: 203.436
	scaleway 100 MiB                 median: 3653ms, min: 2393ms, max: 4615ms, standard_deviation: 687.509
