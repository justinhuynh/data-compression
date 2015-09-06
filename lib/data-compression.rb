# YOUR CODE GOES HERE
require_relative 'compressor'

operation = ARGV[0]
filename = ARGV[1]

compressor = TextCompressor.new

if operation == '-c'
  compressor.compress(filename)
elsif operation == '-u'
  compressor.decompress(filename)
end
