		                 
This is a small script to benchmark different S3 providers

1. Run `make create_files`
2. Copy `storage-example.yml` to `storage.yml` and fill it up
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

	aws 0 B              median:     39ms, min:     32ms, max:     42ms, standard_deviation:  2.857
	google 0 B           median:     88ms, min:     69ms, max:     97ms, standard_deviation:  8.487
	scaleway 0 B         median:   1041ms, min:    406ms, max:   2058ms, standard_deviation: 544.566
	
	aws 1 KiB            median:     44ms, min:     32ms, max:     64ms, standard_deviation: 10.711
	google 1 KiB         median:     94ms, min:     70ms, max:    119ms, standard_deviation: 14.408
	scaleway 1 KiB       median:    662ms, min:    253ms, max:   1103ms, standard_deviation: 261.718
	
	aws 10 KiB           median:     53ms, min:     35ms, max:     70ms, standard_deviation: 12.459
	google 10 KiB        median:     97ms, min:     79ms, max:    127ms, standard_deviation: 13.375
	scaleway 10 KiB      median:    481ms, min:    408ms, max:   1412ms, standard_deviation: 313.153
	
	aws 100 KiB          median:     48ms, min:     43ms, max:    129ms, standard_deviation: 29.741
	google 100 KiB       median:    105ms, min:     88ms, max:    148ms, standard_deviation: 17.929
	scaleway 100 KiB     median:    387ms, min:    249ms, max:    853ms, standard_deviation: 186.44
	
	aws 1 MiB            median:    125ms, min:    103ms, max:    151ms, standard_deviation: 14.766
	google 1 MiB         median:    120ms, min:     98ms, max:    468ms, standard_deviation: 111.038
	scaleway 1 MiB       median:    635ms, min:    321ms, max:   1597ms, standard_deviation: 454.043
	
	aws 10 MiB           median:    258ms, min:    230ms, max:    422ms, standard_deviation: 63.295
	google 10 MiB        median:    250ms, min:    232ms, max:    320ms, standard_deviation: 29.855
	scaleway 10 MiB      median:    646ms, min:    392ms, max:   1780ms, standard_deviation: 486.081
	
	aws 100 MiB          median:    886ms, min:    824ms, max:   1311ms, standard_deviation: 142.72
	google 100 MiB       median:   1592ms, min:   1178ms, max:   5251ms, standard_deviation: 1204.098
	scaleway 100 MiB     median:   3201ms, min:   2672ms, max:   4342ms, standard_deviation: 644.541
