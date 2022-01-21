#!/usr/bin/env ruby
# 
# This will test speed for S3 storage for different provider
# Set credentials in .envrc and use `direnv allow`

require "aws-sdk-s3"
require "aws-sdk-core"
require "base64"
require "faraday"
require "faraday/net_http"
require "benchmark"
require "pry-byebug"

STDOUT.sync = true

def direct_upload(upload_url:, upload_headers:, file:)
  conn = Faraday.new(
    url: upload_url,
    headers: upload_headers
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

def run_benchmark(service:, access_key:, secret_access_key:, region:, bucket:, endpoint: nil, file:, count: 10)
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

  times = []
  name = "#{service} #{as_size(content_length)}"
  #Benchmark.bm(name.size) do |x|
    #x.report(name) do
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
    #end

      puts "#{name.ljust(20)} median: #{median(times).debug.rjust(6)}ms, min: #{times.min.debug.rjust(6)}ms, max: #{times.max.debug.rjust(6)}ms, standard_deviation: #{standard_deviation(times).debug(3).rjust(6)}"
    #times.each_with_index do |time, index|
      #puts "#{index.to_s.ljust(2)} #{name} #{time.debug}ms"
    #end
  #end

  s3 = Aws::S3::Resource.new
  s3.bucket(bucket).object(key).delete
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

  "#{number} #{UNITS[ exponent ]}"
end

Dir.glob('files/*').each do|file|
  run_benchmark(service: :aws,
                access_key: ENV["AWS_ACCESS_KEY_ID"],
                secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
                region: ENV["AWS_REGION"],
                bucket: ENV["AWS_BUCKET"],
                endpoint: ENV["AWS_ENDPOINT"],
                file: file)

  run_benchmark(service: :google,
                access_key: ENV["GOOGLE_ACCESS_KEY_ID"],
                secret_access_key: ENV["GOOGLE_SECRET_ACCESS_KEY"],
                region: ENV["GOOGLE_REGION"],
                bucket: ENV["GOOGLE_BUCKET"],
                endpoint: ENV["GOOGLE_ENDPOINT"],
                file: file)

  run_benchmark(service: :scaleway,
                access_key: ENV["SCALEWAY_ACCESS_KEY_ID"],
                secret_access_key: ENV["SCALEWAY_SECRET_ACCESS_KEY"],
                region: ENV["SCALEWAY_REGION"],
                bucket: ENV["SCALEWAY_BUCKET"],
                endpoint: ENV["SCALEWAY_ENDPOINT"],
                file: file)
  puts ""
end
