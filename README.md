		                 
This is a small script to benchmark different S3 providers

1. Run `make create_files`
2. Copy `storage-example.yml` to `storage.yml` and fill it up
4. Run `make run`

If you run those on a specific ISP, send a Pull Requests with results

* AWS: fastest and very consistent
* DigitalOcean: impressive, almost as fast as AWS
* Google: slightly slower than S3
* Scaleway: much slower, and massive standard deviation

  +------------------------------------------------------------------------------+
  |                       S3 benchmarks on multi provider                        |
  +----------------------+-------------+-------------+-------------+-------------+
  | Provider             |      Median |         Min |         Max |   Deviation |
  +----------------------+-------------+-------------+-------------+-------------+
  | Testing with file size: 0B                                                   |
  +------------------------------------------------------------------------------+
  | Direct Upload                                                                |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |          43 |          36 |          54 |           6 |
  | scaleway par         |         822 |         425 |        3434 |        1085 |
  | scaleway ams         |         411 |         323 |         477 |          45 |
  | scaleway war         |         455 |         391 |         485 |          30 |
  | google europe-west-1 |         107 |          74 |         152 |          26 |
  | digitalocean ams3    |          79 |          72 |          82 |           3 |
  | digitalocean fra1    |          92 |          76 |         109 |          10 |
  +----------------------+-------------+-------------+-------------+-------------+
  | Direct Download                                                              |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |          38 |          34 |          56 |           6 |
  | scaleway par         |         248 |         138 |        1195 |         306 |
  | scaleway ams         |         333 |         315 |         385 |          23 |
  | scaleway war         |         311 |         301 |         378 |          29 |
  | google europe-west-1 |          68 |          61 |         134 |          22 |
  | digitalocean ams3    |          65 |          61 |          70 |           3 |
  | digitalocean fra1    |          78 |          73 |          83 |           3 |
  +----------------------+-------------+-------------+-------------+-------------+
  
  +------------------------------------------------------------------------------+
  | Testing with file size: 1KiB                                                 |
  +------------------------------------------------------------------------------+
  | Direct Upload                                                                |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |          65 |          52 |          98 |          13 |
  | scaleway par         |         694 |         224 |        1292 |         422 |
  | scaleway ams         |         462 |         342 |         594 |          79 |
  | scaleway war         |         404 |         388 |         433 |          14 |
  | google europe-west-1 |         100 |          78 |         174 |          28 |
  | digitalocean ams3    |          86 |          65 |         112 |          13 |
  | digitalocean fra1    |         103 |          90 |         118 |           9 |
  +----------------------+-------------+-------------+-------------+-------------+
  | Direct Download                                                              |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |          54 |          39 |          65 |           7 |
  | scaleway par         |         322 |         197 |        1640 |         452 |
  | scaleway ams         |         299 |         259 |         393 |          39 |
  | scaleway war         |         315 |         305 |         461 |          47 |
  | google europe-west-1 |          86 |          80 |         136 |          21 |
  | digitalocean ams3    |          67 |          58 |          95 |          11 |
  | digitalocean fra1    |          76 |          70 |          81 |           3 |
  +----------------------+-------------+-------------+-------------+-------------+
  
  +------------------------------------------------------------------------------+
  | Testing with file size: 10KiB                                                |
  +------------------------------------------------------------------------------+
  | Direct Upload                                                                |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |          70 |          62 |          97 |          13 |
  | scaleway par         |         777 |         340 |        3665 |        1000 |
  | scaleway ams         |         442 |         371 |         706 |         123 |
  | scaleway war         |         433 |         390 |         487 |          36 |
  | google europe-west-1 |         117 |          90 |         159 |          20 |
  | digitalocean ams3    |          77 |          67 |          89 |           6 |
  | digitalocean fra1    |          98 |          87 |         112 |           8 |
  +----------------------+-------------+-------------+-------------+-------------+
  | Direct Download                                                              |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |          50 |          38 |          62 |           8 |
  | scaleway par         |         603 |         186 |        3223 |         943 |
  | scaleway ams         |         336 |         270 |         354 |          25 |
  | scaleway war         |         325 |         303 |         393 |          36 |
  | google europe-west-1 |          83 |          75 |         105 |          11 |
  | digitalocean ams3    |          74 |          59 |          82 |           7 |
  | digitalocean fra1    |          86 |          84 |          94 |           4 |
  +----------------------+-------------+-------------+-------------+-------------+
  
  +------------------------------------------------------------------------------+
  | Testing with file size: 100KiB                                               |
  +------------------------------------------------------------------------------+
  | Direct Upload                                                                |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |          82 |          68 |         112 |          12 |
  | scaleway par         |         452 |         344 |        2071 |         663 |
  | scaleway ams         |         528 |         454 |         986 |         154 |
  | scaleway war         |         401 |         376 |         408 |          11 |
  | google europe-west-1 |         122 |         115 |         141 |           8 |
  | digitalocean ams3    |         119 |         111 |         135 |           9 |
  | digitalocean fra1    |         148 |         130 |         198 |          18 |
  +----------------------+-------------+-------------+-------------+-------------+
  | Direct Download                                                              |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |          59 |          50 |          71 |           7 |
  | scaleway par         |         338 |         198 |        1022 |         254 |
  | scaleway ams         |         387 |         183 |         469 |          92 |
  | scaleway war         |         421 |         410 |         492 |          34 |
  | google europe-west-1 |          85 |          69 |         102 |          11 |
  | digitalocean ams3    |         102 |          93 |         110 |           5 |
  | digitalocean fra1    |         129 |         117 |         136 |           7 |
  +----------------------+-------------+-------------+-------------+-------------+
  
  +------------------------------------------------------------------------------+
  | Testing with file size: 1MiB                                                 |
  +------------------------------------------------------------------------------+
  | Direct Upload                                                                |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |         227 |         200 |         288 |          28 |
  | scaleway par         |         758 |         460 |        3647 |        1071 |
  | scaleway ams         |         590 |         452 |        1144 |         217 |
  | scaleway war         |         443 |         422 |         490 |          22 |
  | google europe-west-1 |         186 |         174 |         201 |           9 |
  | digitalocean ams3    |         256 |         199 |         360 |          67 |
  | digitalocean fra1    |         298 |         227 |         457 |          70 |
  +----------------------+-------------+-------------+-------------+-------------+
  | Direct Download                                                              |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |          99 |          71 |         139 |          19 |
  | scaleway par         |         393 |         249 |        1332 |         328 |
  | scaleway ams         |         409 |         227 |         525 |          74 |
  | scaleway war         |         538 |         506 |         600 |          36 |
  | google europe-west-1 |         122 |          85 |         233 |          42 |
  | digitalocean ams3    |         144 |         124 |         167 |          12 |
  | digitalocean fra1    |         177 |         163 |         192 |          12 |
  +----------------------+-------------+-------------+-------------+-------------+
  
  +------------------------------------------------------------------------------+
  | Testing with file size: 10MiB                                                |
  +------------------------------------------------------------------------------+
  | Direct Upload                                                                |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |         484 |         459 |         628 |          49 |
  | scaleway par         |        1613 |         640 |        2370 |         591 |
  | scaleway ams         |        1012 |         597 |        2238 |         542 |
  | scaleway war         |         723 |         689 |         795 |          30 |
  | google europe-west-1 |         874 |         432 |        1614 |         352 |
  | digitalocean ams3    |         674 |         499 |        1607 |         340 |
  | digitalocean fra1    |         536 |         494 |        1631 |         368 |
  +----------------------+-------------+-------------+-------------+-------------+
  | Direct Download                                                              |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |         182 |         163 |         365 |          61 |
  | scaleway par         |         568 |         396 |        2124 |         519 |
  | scaleway ams         |         504 |         460 |         578 |          34 |
  | scaleway war         |         688 |         662 |         749 |          28 |
  | google europe-west-1 |         184 |         168 |         319 |          50 |
  | digitalocean ams3    |         233 |         211 |         263 |          14 |
  | digitalocean fra1    |         276 |         263 |         294 |          12 |
  +----------------------+-------------+-------------+-------------+-------------+
  
  +------------------------------------------------------------------------------+
  | Testing with file size: 100MiB                                               |
  +------------------------------------------------------------------------------+
  | Direct Upload                                                                |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |        1686 |        1649 |        1703 |          19 |
  | scaleway par         |        4121 |        1898 |        5391 |        1077 |
  | scaleway ams         |        5001 |        1972 |        8313 |        2483 |
  | scaleway war         |        2184 |        1985 |        2546 |         201 |
  | google europe-west-1 |        2024 |        1763 |        3038 |         498 |
  | digitalocean ams3    |        1992 |        1805 |        5613 |        1150 |
  | digitalocean fra1    |        2109 |        1872 |        9638 |        2382 |
  +----------------------+-------------+-------------+-------------+-------------+
  | Direct Download                                                              |
  +----------------------+-------------+-------------+-------------+-------------+
  | aws eu-west-3        |        1071 |        1066 |        1376 |          96 |
  | scaleway par         |        1761 |        1387 |        3207 |         677 |
  | scaleway ams         |        1384 |        1256 |        1622 |          93 |
  | scaleway war         |        1981 |        1808 |        2414 |         220 |
  | google europe-west-1 |        1014 |         992 |        1048 |          17 |
  | digitalocean ams3    |        1046 |        1025 |        1071 |          15 |
  | digitalocean fra1    |        1153 |        1063 |        1208 |          47 |
  +----------------------+-------------+-------------+-------------+-------------+
