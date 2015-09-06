require_relative 'binary_tree'
require_relative 'compression_test'
require 'json'

class TextCompressor
  def compress(filename)
    comp_filename = "#{filename}.compressed"
    stats = CompressionTest.new(filename, comp_filename)
    file_contents = read_file(filename)
    char_freq = char_frequency(file_contents)
    code_table = build_code_table(char_freq)
    header = build_header(code_table)
    encoded_text = encode_string(code_table, file_contents)
    compressed_text = "#{header}#{encoded_text}"
    write_file(comp_filename, compressed_text)
    puts "file compressed\n#{comp_filename} created\n"
    puts output_operation_stats(stats)
  end

  def decompress(filename)
    decomp_filename = "_#{filename}"
    decomp_time = CompressionTest.new
    decomp_filename.slice!(/.compressed/)
    compressed_file = read_file(filename)
    parsed_file = read_header(compressed_file)
    header = parsed_file[0]
    body = parsed_file[1]
    decompressed_file = decode_string(header,body)
    write_file(decomp_filename, decompressed_file)
    puts decomp_time.finish
    puts "file uncompressed\n#{decomp_filename} created\n"
  end

  def read_file(filename)
    File.read(filename)
  end

  def write_file(filename, compressed_string)
    File.write(filename, compressed_string)
  end

  def char_frequency(file_string)
    str_arr = file_string.split('')
    uniq_str_arr = str_arr.uniq
    raw_freq = uniq_str_arr.map { |c| str_arr.count(c).to_f / str_arr.length }
    final_freq = Hash[uniq_str_arr.zip(raw_freq)]
    sorted_freq = final_freq.sort_by { |k, v| -v }
    Hash[sorted_freq]
  end

  def build_code_table(char_frequency)
    binary_tree = BinaryTree.new(char_frequency)
    code_table = binary_tree.code_table
  end

  def encode_string(code_table, file_string)
    coded_char_array = []
    file_string.each_char { |c| coded_char_array << code_table[c] }
    encoded_string = coded_char_array.join
    [encoded_string].pack("B*")
  end

  def build_header(code_table)
    header_table = JSON.generate(code_table)
    header_length = "%08d" % (header_table.length)
    header_length + header_table
  end

  def read_header(file_string)
    header_length = file_string.slice!(0..7).to_i
    header = file_string.slice!(0..header_length - 1)
    code_table = JSON.parse(header)
    [code_table, file_string]
  end

  def decode_string(code_table, file_string)
    raw_decomp = file_string.unpack('B*').first
    shortest_code = code_table.min_by { |char, code| code.length }
    min_length = shortest_code.last.length
    lookup_table = code_table.invert
    decoded_char_array = []
    cur_length = min_length - 1
    until raw_decomp.length <= min_length
      test_block = raw_decomp[0..cur_length]

      if lookup_table.has_key?(test_block)
        print lookup_table[test_block]
        decoded_char_array << lookup_table[test_block]
        raw_decomp.slice!(0..cur_length)
        cur_length = min_length - 1
      else
        cur_length += 1
      end
    end
    decoded_char_array.join
  end

  def output_operation_stats(compression_test)
    compression_test.finish
    compression_test.compression_statistics
  end
end
