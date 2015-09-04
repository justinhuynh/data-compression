# YOUR CODE GOES HERE
require 'pry'
require_relative 'huffman'

# create these as class methods?

class TextCompressor
  attr_reader :file_string

  def compress(filename)
    read_file(original_file)
    char_frequency
    build_code_table

  end

  def decompress(filename)

  end

  def read_file(filename)
    file_string = File.read(filename)
  end

  def write_file(filename, compressed_string)
    File.write(filename, compressed_string)
  end

  def char_frequency
    str_arr = file_string.split('')
    uniq_str_arr = str_arr.uniq
    raw_freq = uniq_str_arr.map { |c| str_arr.count(c).to_f / str_arr.length }
    final_freq = Hash[uniq_str_arr.zip(raw_freq)]
    sorted_freq = final_freq.sort_by { |k, v| -v }
    Hash[sorted_freq]
  end

  def build_code_table(char_frequency)
    code_table = Binary.new(char_frequency)
  end

  def encode(code_table)
    coded_char_array = []
    file_string.each_char { |c| coded_char_array << code_table[c] }
    encoded_string = coded_char_array.join
    compressed = [encoded_string].pack("B*")
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

      if lookup_table.has_key?(test_block)
        decoded_char_array << lookup_table[test_block]
        raw_decomp.slice!(0..cur_length)
        cur_length = min_length - 1
      else
        cur_length += 1
      end
    end

    decoded_char_array.join
  end
end

class CompressionTest
  attr_reader :original, :compressed, :decompressed

  def initialize(original, compressed, decompressed)
    @original = original
    @compressed = compressed
    @decompressed = decompressed
  end

  def compare_orig_to_comp
    orig_stat = File.stat(original)
    comp_stat = File.stat(compressed)
    binding.pry
  end

  def compare_orig_to_decomp
    orig_file = File.read(original)
    decomp_file = File.read(decompressed)
    binding.pry
  end
end
