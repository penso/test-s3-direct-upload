		                 
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

	aws 0 B                median:    34ms, min:    30ms, max:    48ms, deviation:    7
	scaleway par 0 B       median:  1204ms, min:   336ms, max:  1924ms, deviation:  550
	scaleway ams 0 B       median:   371ms, min:   277ms, max:   442ms, deviation:   51
	scaleway war 0 B       median:   422ms, min:   365ms, max:   447ms, deviation:   35
	google 0 B             median:   102ms, min:    84ms, max:   155ms, deviation:   21
	
	aws 1 KiB              median:    44ms, min:    34ms, max:    70ms, deviation:   12
	scaleway par 1 KiB     median:   595ms, min:   294ms, max:  1544ms, deviation:  397
	scaleway ams 1 KiB     median:   448ms, min:   336ms, max:   553ms, deviation:   73
	scaleway war 1 KiB     median:   387ms, min:   354ms, max:   439ms, deviation:   27
	google 1 KiB           median:   103ms, min:    87ms, max:   131ms, deviation:   12
	
	aws 10 KiB             median:    59ms, min:    34ms, max:    80ms, deviation:   15
	scaleway par 10 KiB    median:   397ms, min:   241ms, max:  1408ms, deviation:  384
	scaleway ams 10 KiB    median:   409ms, min:   369ms, max:  1176ms, deviation:  243
	scaleway war 10 KiB    median:   374ms, min:   354ms, max:   415ms, deviation:   16
	google 10 KiB          median:    98ms, min:    72ms, max:   137ms, deviation:   19
	
	aws 100 KiB            median:    51ms, min:    40ms, max:    76ms, deviation:   11
	scaleway par 100 KiB   median:   583ms, min:   177ms, max:  1701ms, deviation:  526
	scaleway ams 100 KiB   median:   538ms, min:   371ms, max:  1047ms, deviation:  197
	scaleway war 100 KiB   median:   374ms, min:   361ms, max:   445ms, deviation:   30
	google 100 KiB         median:   108ms, min:   100ms, max:   115ms, deviation:    6
	
	aws 1 MiB              median:   138ms, min:   103ms, max:   162ms, deviation:   16
	scaleway par 1 MiB     median:   786ms, min:   346ms, max:  2807ms, deviation:  813
	scaleway ams 1 MiB     median:   539ms, min:   364ms, max:   990ms, deviation:  190
	scaleway war 1 MiB     median:   401ms, min:   379ms, max:   489ms, deviation:   40
	google 1 MiB           median:   122ms, min:   104ms, max:   134ms, deviation:   10
	
	aws 10 MiB             median:   284ms, min:   243ms, max:   396ms, deviation:   51
	scaleway par 10 MiB    median:   836ms, min:   541ms, max:  1708ms, deviation:  440
	scaleway ams 10 MiB    median:   633ms, min:   491ms, max:  1389ms, deviation:  258
	scaleway war 10 MiB    median:   524ms, min:   505ms, max:   592ms, deviation:   29
	google 10 MiB          median:   285ms, min:   237ms, max:   406ms, deviation:   51
	
	aws 100 MiB            median:  1128ms, min:  1037ms, max:  1569ms, deviation:  173
	scaleway par 100 MiB   median:  3021ms, min:  2242ms, max:  5386ms, deviation: 1130
	scaleway ams 100 MiB   median:  1874ms, min:  1749ms, max:  2035ms, deviation:  109
	scaleway war 100 MiB   median:  1700ms, min:  1629ms, max:  2014ms, deviation:  108
	google 100 MiB         median:  1323ms, min:  1111ms, max:  1544ms, deviation:  173
