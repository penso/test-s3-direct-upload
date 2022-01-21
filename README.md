		                 
This is a small script to benchmark different S3 providers

1. Run `make create_files`
2. Copy `storage-example.yml` to `storage.yml` and fill it up
4. Run `make run`

If you run those on a specific ISP, send a Pull Requests with results

* AWS: fastest and very consistent
* Google: slightly slower than S3
* Scaleway: much slower, and massive standard deviation

From Orange ISP

	aws 0 B                median:    54ms, min:    43ms, max:    81ms, deviation:   13
	scaleway par 0 B       median:   581ms, min:   366ms, max:  1400ms, deviation:  325
	scaleway ams 0 B       median:   376ms, min:   303ms, max:   454ms, deviation:   46
	scaleway war 0 B       median:   412ms, min:   389ms, max:   481ms, deviation:   38
	google 0 B             median:   115ms, min:    93ms, max:   238ms, deviation:   41
	
	aws 1 KiB              median:    70ms, min:    54ms, max:    79ms, deviation:    8
	scaleway par 1 KiB     median:   651ms, min:   354ms, max:  2043ms, deviation:  643
	scaleway ams 1 KiB     median:   481ms, min:   174ms, max:   954ms, deviation:  236
	scaleway war 1 KiB     median:   393ms, min:   385ms, max:   448ms, deviation:   19
	google 1 KiB           median:   105ms, min:    84ms, max:   143ms, deviation:   17
	
	aws 10 KiB             median:    66ms, min:    46ms, max:    94ms, deviation:   13
	scaleway par 10 KiB    median:   453ms, min:   270ms, max:  1077ms, deviation:  298
	scaleway ams 10 KiB    median:   503ms, min:   207ms, max:   710ms, deviation:  151
	scaleway war 10 KiB    median:   438ms, min:   378ms, max:   499ms, deviation:   41
	google 10 KiB          median:   123ms, min:    99ms, max:   202ms, deviation:   30
	
	aws 100 KiB            median:   106ms, min:    77ms, max:   127ms, deviation:   18
	scaleway par 100 KiB   median:   864ms, min:   367ms, max:  3197ms, deviation:  893
	scaleway ams 100 KiB   median:   606ms, min:   471ms, max:   895ms, deviation:  121
	scaleway war 100 KiB   median:   418ms, min:   393ms, max:   486ms, deviation:   34
	google 100 KiB         median:   136ms, min:   119ms, max:   168ms, deviation:   14
	
	aws 1 MiB              median:   227ms, min:   195ms, max:   275ms, deviation:   22
	scaleway par 1 MiB     median:  1107ms, min:   305ms, max:  2562ms, deviation:  758
	scaleway ams 1 MiB     median:   709ms, min:   448ms, max:  4341ms, deviation: 1188
	scaleway war 1 MiB     median:   440ms, min:   429ms, max:   499ms, deviation:   26
	google 1 MiB           median:   194ms, min:   183ms, max:   213ms, deviation:    9
	
	aws 10 MiB             median:   480ms, min:   459ms, max:  1135ms, deviation:  208
	scaleway par 10 MiB    median:  1433ms, min:   605ms, max:  2366ms, deviation:  555
	scaleway ams 10 MiB    median:  1726ms, min:   642ms, max:  2213ms, deviation:  546
	scaleway war 10 MiB    median:   712ms, min:   673ms, max:   735ms, deviation:   22
	google 10 MiB          median:   921ms, min:   443ms, max:  1489ms, deviation:  365
	
	aws 100 MiB            median:  2036ms, min:  1686ms, max:  2645ms, deviation:  332
	scaleway par 100 MiB   median:  3392ms, min:  1876ms, max:  4655ms, deviation:  924
	scaleway ams 100 MiB   median:  4863ms, min:  1875ms, max:  7101ms, deviation: 2357
	scaleway war 100 MiB   median:  2283ms, min:  2031ms, max:  2410ms, deviation:  107
	google 100 MiB         median:  1834ms, min:  1721ms, max:  2274ms, deviation:  224

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
