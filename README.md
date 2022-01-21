		                 
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

	aws 0 B              median:     48ms, min:     39ms, max:     54ms, standard_deviation:  5.252
	google 0 B           median:    101ms, min:     82ms, max:    205ms, standard_deviation: 40.725
	scaleway 0 B         median:   1654ms, min:    537ms, max:   2822ms, standard_deviation: 820.154
	
	aws 1 KiB            median:     61ms, min:     42ms, max:     78ms, standard_deviation:  9.537
	google 1 KiB         median:     89ms, min:     72ms, max:    123ms, standard_deviation: 14.686
	scaleway 1 KiB       median:    532ms, min:    193ms, max:   2005ms, standard_deviation: 687.31
	
	aws 10 KiB           median:     66ms, min:     52ms, max:    105ms, standard_deviation: 17.521
	google 10 KiB        median:    148ms, min:    118ms, max:    190ms, standard_deviation: 24.868
	scaleway 10 KiB      median:    586ms, min:    285ms, max:   2058ms, standard_deviation: 576.028
	
	aws 100 KiB          median:    115ms, min:     81ms, max:    149ms, standard_deviation:  21.14
	google 100 KiB       median:    124ms, min:    116ms, max:    151ms, standard_deviation: 10.518
	scaleway 100 KiB     median:   1247ms, min:    282ms, max:   2385ms, standard_deviation: 817.927
	
	aws 1 MiB            median:    228ms, min:    195ms, max:    264ms, standard_deviation: 20.384
	google 1 MiB         median:    188ms, min:    176ms, max:    212ms, standard_deviation: 10.322
	scaleway 1 MiB       median:    791ms, min:    455ms, max:   3849ms, standard_deviation: 1075.258
	
	aws 10 MiB           median:    498ms, min:    462ms, max:    787ms, standard_deviation: 94.949
	google 10 MiB        median:    447ms, min:    427ms, max:    870ms, standard_deviation: 203.245
	scaleway 10 MiB      median:   1031ms, min:    485ms, max:   5110ms, standard_deviation: 1340.932
	
	aws 100 MiB          median:   2177ms, min:   1653ms, max:   2576ms, standard_deviation: 329.263
	google 100 MiB       median:   2227ms, min:   1755ms, max:   2499ms, standard_deviation: 237.857
	scaleway 100 MiB     median:   3484ms, min:   1911ms, max:  10303ms, standard_deviation: 2315.799

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
