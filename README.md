		                 
This is a small script to benchmark different S3 providers

1. Run `make create_files`
2. Copy `.envrc-example` to `.envrc`
3. Run `direnv allow`
4. Run `make run`

If you run those on a specific ISP, send a Pull Requests with results

* AWS: fastest and very consistent
* Google: slightly slower than S3
* Scaleway: much slower, and massive standard deviation
