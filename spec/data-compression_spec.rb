require_relative '../lib/data-compression'
require 'pry'

RSpec.describe TextCompressor do

  describe "#initialize" do
  filename = 'file.txt'
  let(:test_string) { TextCompressor.new( ) }

    # update filename
    # store test string in filename

    it "takes a filename as input" do

    end

    it "creates a new TextCompressor object" do
      expect(test_string).to be_a(TextCompressor)
    end

    it "reads file contents and stores contents as a string" do

    end
  end

  describe "#char_frequency" do
    it "calculates frequency of given character" do
      expect(test_string.char_frequency(#string))
    end
  end

  describe "#generate_code" do
    it "runs through huffman tree to generate prefix-free binary code of varying lengths" do

    end
  end

  describe "#map_char_code" do
    it "assigns shortest code to most frequent characters" do

    end
  end

  describe "#write_code_table" do
    it "saves the char code to string" do

    end
  end

  describe "#encode" do
    it "splits string into array of characters" do

    end

    it "looks up each character in the code table and returns coded binary value" do

    end

    it "stores coded binary value in a new array" do

    end
  end

  describe "#compress" do
    it "joins the new array into a single long binary string" do

    end

    it "packs the binary string back into unsigned 8-bit encoding" do

    end

    it "returns packed, encoded string" do

    end

    it "packs, but does not encode code table" do

    end
  end

  describe "#write_compressed" do
    it "writes the code table to file as header" do

    end

    it "writes compressed string to file" do

    end
  end

  describe "#decode" do
    it "unpacks compressed string" do

    end

    it "extracts header to recreate code table" do

    end

    it "creates a bit array through slicing, returning the first value that matches" do

    end

    it "looks up the array of bit-codes to return encoded character" do

    end

    it "adds decoded character to string array" do

    end

    it "joins string array to return decompressed file" do

    end
  end

  describe "#calculate_file_size" do
    it "calculates the size of the file" do
      # how is file size determined?
    end
  end

  describe "#benchmark_operation" do
    it "calculates time to compress" do
    end
    end
  end

  describe "#compression_ratio" do
    it "compares size of the compressed file to the original" do

    end
  end

  describe "#load_file" do
    it "loads file to be converted" do
    end
  end



  describe "#decompress file" do
    it "takes compressed file and converts to decompressed file" do
    end
  end

end


RSpec.describe CompressionTest do

  describe "#initialize" do
    it "takes original, compressed, and decompressed files" do

    end
  end

  describe "#compare_orig_to_decompressed" do
    it "compares strings from original and decompressed files" do

    end
  end

  describe "#compare_orig_to_compressed" do
    it "compares file stats from original and decompressed files" do
      
    end
  end

end
