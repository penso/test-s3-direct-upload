create_files:
	mkdir -p files
	touch files/0
	truncate -s 1K files/1
	truncate -s 10K files/2
	truncate -s 100K files/3
	truncate -s 1M files/4
	truncate -s 10M files/5
	truncate -s 100M files/6

run:
	bundle exec ./test_storage.rb
