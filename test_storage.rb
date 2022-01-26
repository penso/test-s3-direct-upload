#!/usr/bin/env ruby
# 
# This will test speed for S3 storage for different provider. Ugly script...
# Set buckets in `storage.yml`

require "aws-sdk-s3"
require "aws-sdk-core"
require "base64"
require "faraday"
require "faraday/net_http"
require "benchmark"
require "pry-byebug"
require "yaml" 
require "terminal-table"

STDOUT.sync = true

def direct_upload(upload_url:, upload_headers:, file:)
  conn = Faraday.new(
    url: upload_url,
    headers: upload_headers,
    ssl: { verify: false }
  ) do |faraday|
    faraday.adapter :net_http
  end

  before = Time.now
  response = conn.put do |req|
    req.body = File.binread(file)
  end

  if response.status != 200
    puts "ERROR: #{response.status}"
  end
  after = Time.now

  after - before
end

def download(download_url)
  conn = Faraday.new(
    url: download_url,
    ssl: { verify: false }
  ) do |faraday|
    faraday.adapter :net_http
  end

  before = Time.now
  response = conn.get do |req|
  end

  if response.status != 200
    puts "ERROR: #{response.status}"
  end
  after = Time.now

  after - before
end

def delete(bucket, key)
  s3 = Aws::S3::Resource.new
  s3.bucket(bucket).object(key).delete
end

def run_upload_benchmark(service:, access_key:, secret_access_key:, region:, bucket:, endpoint: nil, file:, count: 10)
  Aws.config.update(
    region: region,
    endpoint: endpoint,
    credentials: Aws::Credentials.new(access_key, secret_access_key),
    ssl_verify_peer: false
  )

  file_io = IO.read(file)
  checksum = Digest::MD5.base64digest(file_io)
  content_length = file_io.bytesize
  content_type = "application/octet-stream"
  key = "test_file"
  content_disposition = "inline; filename=\"test_file\"; filename*=UTF-8''test_file"

  times = []
  name = service

  # 1. Testing direct uploads
  signer = Aws::S3::Presigner.new

  params = {
    expires_in: 600,
    content_type: content_type,
    content_length: content_length,
    content_md5: checksum,
    whitelist_headers: ["content-length"],
    bucket: bucket,
    key: key
  }

  url = signer.presigned_url(:put_object, params)
  headers = { "Content-Type" => content_type,
              "Content-MD5" => checksum,
              "Content-Disposition" => content_disposition,
              "Content-Length" => content_length.to_s}
  count.times do
    times << direct_upload(upload_url: url, upload_headers: headers, file: file)
  end

  puts "#{name.ljust(20)} median: #{median(times).debug.rjust(5)}ms, min: #{times.min.debug.rjust(5)}ms, max: #{times.max.debug.rjust(5)}ms, deviation: #{standard_deviation(times).debug(0).rjust(4)}"

  # 3. delete files
  delete(bucket, key)

  {
    name: name,
    median: median(times).debug,
    min: times.min.debug,
    max: times.max.debug,
    deviation: standard_deviation(times).debug(0)
  }
rescue
  puts "failed: #{$!}"
end

def run_download_benchmark(service:, access_key:, secret_access_key:, region:, bucket:, endpoint: nil, file:, count: 10)
  Aws.config.update(
    region: region,
    endpoint: endpoint,
    credentials: Aws::Credentials.new(access_key, secret_access_key)
  )

  file_io = IO.read(file)
  checksum = Digest::MD5.base64digest(file_io)
  content_length = file_io.bytesize
  content_type = "application/octet-stream"
  key = "test_file"
  content_disposition = "inline; filename=\"test_file\"; filename*=UTF-8''test_file"
  signer = Aws::S3::Presigner.new

  params = {
    expires_in: 600,
    content_type: content_type,
    content_length: content_length,
    content_md5: checksum,
    whitelist_headers: ["content-length"],
    bucket: bucket,
    key: key
  }

  url = signer.presigned_url(:put_object, params)
  headers = { "Content-Type" => content_type,
              "Content-MD5" => checksum,
              "Content-Disposition" => content_disposition,
              "Content-Length" => content_length.to_s}
  direct_upload(upload_url: url, upload_headers: headers, file: file)

  url = signer.presigned_url(:get_object, bucket: bucket, key: key)

  times = []
  count.times do
    times << download(url)
  end

  name = service

  puts "#{name.ljust(20)} median: #{median(times).debug.rjust(5)}ms, min: #{times.min.debug.rjust(5)}ms, max: #{times.max.debug.rjust(5)}ms, deviation: #{standard_deviation(times).debug(0).rjust(4)}"

  delete(bucket, key)

  {
    name: name,
    median: median(times).debug,
    min: times.min.debug,
    max: times.max.debug,
    deviation: standard_deviation(times).debug(0)
  }
end

class Float
  def debug(round = 0)
    (self * 1000.0).round(round).to_s
  end
end

def median(array)
  return nil if array.empty?
  sorted = array.sort
  len = sorted.length
  (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
end

# From https://stackoverflow.com/questions/19484891/how-do-i-find-the-standard-deviation-in-ruby
def standard_deviation(array)
  n = array.size
  array.map!(&:to_f)
  mean = array.reduce(&:+)/n
  sum_sqr = array.map {|x| x * x}.reduce(&:+)
  std_dev = Math.sqrt((sum_sqr - n * mean * mean)/(n-1))
end

UNITS = %W(B KiB MiB GiB TiB).freeze

def as_size number
  if number.to_i < 1024
    exponent = 0

  else
    max_exp  = UNITS.size - 1

    exponent = ( Math.log( number ) / Math.log( 1024 ) ).to_i # convert to base
    exponent = max_exp if exponent > max_exp # we need this to avoid overflow for the highest unit

    number  /= 1024 ** exponent
  end

  "#{number}#{UNITS[ exponent ]}"
end

table = Terminal::Table.new title: "S3 benchmarks on multi provider",
  style: { width: 80 },
  headings: ['Provider',
             {value: 'Median', alignment: :right},
             {value: 'Min', alignment: :right},
             {value: 'Max', alignment: :right},
             {value: 'Deviation', alignment: :right}] do |t|

  Dir.glob('files/*').each do |file|
    config = YAML.load_file("storage.yml")

    file_io = IO.read(file)
    content_length = file_io.bytesize

    puts "Testing with file size: #{as_size(content_length)}"
    puts "Direct Upload"

    t << :separator if t.rows.any?
    t << [{value: "Testing with file size: #{as_size(content_length)}", alignment: :left, colspan: 5}]
    t << :separator
    t << [{value: "Direct Upload", alignment: :left, colspan: 5}]
    t << :separator

    config.each do |provider|
      upload_rows = run_upload_benchmark(service: provider["name"],
                                         access_key: provider["access_key"],
                                         secret_access_key: provider["secret_key"],
                                         region: provider["region"],
                                         bucket: provider["bucket"],
                                         endpoint: provider["endpoint"],
                                         file: file) || {}
      t << upload_rows.values
    end

    puts "Direct Download"

    t << :separator
    t << [{value: "Direct Download", alignment: :left, colspan: 5}]
    t << :separator

    config.each do |provider|
      download_rows = run_download_benchmark(service: provider["name"],
                                             access_key: provider["access_key"],
                                             secret_access_key: provider["secret_key"],
                                             region: provider["region"],
                                             bucket: provider["bucket"],
                                             endpoint: provider["endpoint"],
                                             file: file) || {}
      t << download_rows.values
    end

    t << :separator
    t << [{value: "", colspan: 5}]

    puts ""
  end
end

(1..4).each { table.align_column(_1, :right) }

puts table
