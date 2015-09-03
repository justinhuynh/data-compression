require_relative 'data-compression'
require_relative 'huffman'

FILENAME = 'the_last_question.txt'

file_str = TextCompressor.new(FILENAME)

char_freq = file_str.char_frequency
test_arr = file_str.create_nodes(char_freq)
huff_tree = Huffman.build_tree(test_arr)
key_file = Huffman.create_keys(huff_tree)
compressed_string = file_str.encode(key_file)


output_raw = TextDecompressor.new('output.txt')

# output_raw.decode(key_file)

# CHAR = [ 'c', 'g', 'a', 't' ]
# FREQ = [ 0.05, 0.05, 0.45, 0.45 ]
#
# char_freq = Hash[CHAR.zip(FREQ)]
# test_arr = create_nodes(char_freq)
# huff_tree = Huffman.build_tree(test_arr)
binding.pry
