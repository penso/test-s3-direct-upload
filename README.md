		                 
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

	aws 0 B                          median: 36ms, min: 32ms, max: 76ms, standard_deviation: 18.021
	google 0 B                       median: 90ms, min: 70ms, max: 130ms, standard_deviation: 17.796
	scaleway 0 B                     median: 945ms, min: 301ms, max: 3113ms, standard_deviation: 794.198
	
	aws 1 KiB                        median: 40ms, min: 37ms, max: 57ms, standard_deviation: 6.688
	google 1 KiB                     median: 106ms, min: 88ms, max: 117ms, standard_deviation: 11.176
	scaleway 1 KiB                   median: 624ms, min: 365ms, max: 1913ms, standard_deviation: 637.36
	
	aws 10 KiB                       median: 42ms, min: 37ms, max: 108ms, standard_deviation: 21.412
	google 10 KiB                    median: 95ms, min: 69ms, max: 129ms, standard_deviation: 16.285
	scaleway 10 KiB                  median: 459ms, min: 247ms, max: 1832ms, standard_deviation: 459.743
	
	aws 100 KiB                      median: 55ms, min: 45ms, max: 95ms, standard_deviation: 18.95
	google 100 KiB                   median: 109ms, min: 77ms, max: 323ms, standard_deviation: 72.862
	scaleway 100 KiB                 median: 451ms, min: 224ms, max: 888ms, standard_deviation: 243.959
	
	aws 1 MiB                        median: 141ms, min: 116ms, max: 257ms, standard_deviation: 40.484
	google 1 MiB                     median: 128ms, min: 111ms, max: 165ms, standard_deviation: 18.96
	scaleway 1 MiB                   median: 825ms, min: 312ms, max: 1925ms, standard_deviation: 563.955
	
	aws 10 MiB                       median: 314ms, min: 262ms, max: 622ms, standard_deviation: 119.69
	google 10 MiB                    median: 244ms, min: 228ms, max: 323ms, standard_deviation: 30.316
	scaleway 10 MiB                  median: 1121ms, min: 464ms, max: 3141ms, standard_deviation: 821.851
	
	aws 100 MiB                      median: 1110ms, min: 1038ms, max: 1774ms, standard_deviation: 221.839
	google 100 MiB                   median: 1388ms, min: 1239ms, max: 1600ms, standard_deviation: 120.459
	scaleway 100 MiB                 median: 3167ms, min: 1985ms, max: 5880ms, standard_deviation: 1227.057
