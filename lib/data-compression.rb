# YOUR CODE GOES HERE
require 'pry'
require_relative 'huffman'


class TextCompressor

  OUT_FILE = 'output.txt'

  attr_reader :file_string

  def initialize(filename)
    @file_string = File.read(filename)
  end

  def char_frequency
    str_arr = file_string.split('')
    uniq_str_arr = str_arr.uniq
    raw_freq = uniq_str_arr.map { |c| str_arr.count(c).to_f / str_arr.length }
    final_freq = Hash[uniq_str_arr.zip(raw_freq)]
    sorted_freq = final_freq.sort_by { |k, v| -v }
    Hash[sorted_freq]
  end
    # priority_q = sorted_freq.map { |item| item.first }
    # return array of arrays

  def create_nodes(char_frequency)
    node_array = []

    char_frequency.each do |char, freq|
      new_node = Node.new(char, freq)
      node_array << new_node
    end
    node_array
  end

# values = [*(0..pq_l)].map { |n| "%.7b" % n }
# =begin
# pq_values = Hash[priority_q.zip(values)]
  def encode(code_table)
    coded_char_array = []
    file_string.each_char { |c| coded_char_array << code_table[c] }
    encoded_string = coded_char_array.join
    compressed = [encoded_string].pack("B*")
  end

  def write_file(compressed_string)
    File.write(OUT_FILE, compressed_string)
  end
end


class TextDecompressor

  attr_reader :input_string

  def initialize(filename)
    @input_string = File.read(filename)
  end

  def extract_code_table
    # slice the first part of the input string
  end

  def decode(code_table)
    raw_decomp = input_string.unpack('B*').first
    shortest_code = code_table.min_by { |char, code| code.length }
    min_length = shortest_code.last.length
    lookup_table = code_table.invert

    decoded_char_array = []
    cur_length = min_length - 1

    until raw_decomp.length < min_length
      test_block = raw_decomp[0..cur_length]
      # puts raw_decomp.empty?
      # binding.pry
      # puts "Now testing block #{test_block} of length #{cur_length + 1}"
      if lookup_table.has_key?(test_block)
        puts lookup_table[test_block]
        decoded_char_array << lookup_table[test_block] # lookup char
        raw_decomp.slice!(0..cur_length) # remove matching block from front of string
        cur_length = min_length - 1 # reset cur_length
      else
        cur_length += 1 # extend current length
        # test_block = raw_decomp[0..cur_length]
      end
    end

    decoded_char_array.join

  end
end

=begin
File.stat('output.txt')
raw_comp = File.read('output.txt')

raw_decomp = raw_comp.unpack('B*')

# abstract the number of bits required, based on the number of unique characters that need to be stored
bit_array = raw_decomp[0].scan /.{7}/m

lookup_hash = pq_values.invert

recomp_chars = bit_array.map { |char| lookup_hash[char] }

final = recomp_chars.join

# may need to strip final character
=enkd
end
# binding.pry
=end
