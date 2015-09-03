# require_relative 'data-compression'
# require_relative 'huffman'
#
# FILENAME = 'the_last_question.txt'
# COMPRESSED = 'compressed.txt'
# DECOMPRESSED = 'decompressed.txt'
#
# file_str = TextCompressor.new(FILENAME)
#
# char_freq = file_str.char_frequency
# test_arr = file_str.create_nodes(char_freq)
# huff_tree = Huffman.build_tree(test_arr)
# key_file = Huffman.create_keys(huff_tree)
# compressed_string = file_str.encode(key_file)
# file_str.write_file(compressed_string)
#
# output_raw = TextDecompressor.new(COMPRESSED)
# decompressed_string = output_raw.decode(key_file)
# output_raw.write_file(decompressed_string)
#
#
# compare = CompressionTest.new(FILENAME, COMPRESSED, DECOMPRESSED)
#

require 'pry'

input = ARGV

binding.pry
