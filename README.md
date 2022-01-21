		                 
This is a small script to benchmark different S3 providers

1. Run `make create_files`
2. Copy `storage-example.yml` to `storage.yml` and fill it up
4. Run `make run`

If you run those on a specific ISP, send a Pull Requests with results

* AWS: fastest and very consistent
* Google: slightly slower than S3
* Scaleway: much slower, and massive standard deviation

From Orange ISP

	aws 0 B              median:     54ms, min:     46ms, max:     83ms, standard_deviation: 11.381
	scaleway par 0 B     median:    706ms, min:    223ms, max:   1706ms, standard_deviation: 470.595
	scaleway ams 0 B     median:    433ms, min:    403ms, max:    662ms, standard_deviation: 82.724
	scaleway war 0 B     median:    512ms, min:    403ms, max:   1145ms, standard_deviation: 216.76
	google 0 B           median:    104ms, min:     94ms, max:    122ms, standard_deviation:  9.806
	
	aws 1 KiB            median:     68ms, min:     53ms, max:     95ms, standard_deviation: 14.871
	scaleway par 1 KiB   median:    557ms, min:    293ms, max:    834ms, standard_deviation: 174.333
	scaleway ams 1 KiB   median:    535ms, min:    374ms, max:   1055ms, standard_deviation: 211.146
	scaleway war 1 KiB   median:    466ms, min:    388ms, max:    539ms, standard_deviation: 54.472
	google 1 KiB         median:    142ms, min:     89ms, max:    165ms, standard_deviation: 23.739
	
	aws 10 KiB           median:     76ms, min:     51ms, max:     92ms, standard_deviation:  15.34
	scaleway par 10 KiB  median:    495ms, min:    282ms, max:   1488ms, standard_deviation: 414.295
	scaleway ams 10 KiB  median:    477ms, min:    336ms, max:    645ms, standard_deviation: 96.121
	scaleway war 10 KiB  median:    428ms, min:    388ms, max:    557ms, standard_deviation: 62.314
	google 10 KiB        median:    125ms, min:    106ms, max:    243ms, standard_deviation: 38.321
	
	aws 100 KiB          median:     91ms, min:     70ms, max:    189ms, standard_deviation:  36.15
	scaleway par 100 KiB median:    759ms, min:    201ms, max:   5065ms, standard_deviation: 1459.316
	scaleway ams 100 KiB median:    569ms, min:    460ms, max:    991ms, standard_deviation: 161.992
	scaleway war 100 KiB median:    439ms, min:    379ms, max:    530ms, standard_deviation: 46.908
	google 100 KiB       median:    135ms, min:    112ms, max:    181ms, standard_deviation: 20.261
	
	aws 1 MiB            median:    214ms, min:    203ms, max:    299ms, standard_deviation: 31.774
	scaleway par 1 MiB   median:   1017ms, min:    350ms, max:   2546ms, standard_deviation: 776.469
	scaleway ams 1 MiB   median:    626ms, min:    507ms, max:  22511ms, standard_deviation: 6907.009
	scaleway war 1 MiB   median:    441ms, min:    411ms, max:    494ms, standard_deviation: 30.841
	google 1 MiB         median:    186ms, min:    173ms, max:    212ms, standard_deviation: 11.289
	
	aws 10 MiB           median:    467ms, min:    450ms, max:    532ms, standard_deviation: 27.073
	scaleway par 10 MiB  median:   1289ms, min:    586ms, max:   3307ms, standard_deviation: 828.683
	scaleway ams 10 MiB  median:   1619ms, min:    614ms, max:   2294ms, standard_deviation: 680.289
	scaleway war 10 MiB  median:    726ms, min:    675ms, max:    755ms, standard_deviation: 21.358
	google 10 MiB        median:    477ms, min:    435ms, max:    863ms, standard_deviation: 168.652
	
	aws 100 MiB          median:   1723ms, min:   1650ms, max:   2427ms, standard_deviation: 291.054
	scaleway par 100 MiB median:   3881ms, min:   2211ms, max:   4939ms, standard_deviation: 905.74
	scaleway ams 100 MiB median:   4134ms, min:   1929ms, max:   8050ms, standard_deviation: 2767.345
	scaleway war 100 MiB median:   2323ms, min:   1970ms, max:   2525ms, standard_deviation: 162.751
	google 100 MiB       median:   1788ms, min:   1737ms, max:   2313ms, standard_deviation: 207.87

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
