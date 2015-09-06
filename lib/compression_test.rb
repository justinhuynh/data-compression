class CompressionTest
  attr_reader :original, :compressed, :start_time, :orig_size, :comp_size, :pct_comp, :comp_ratio

  def initialize(original_filename=nil, compressed_filename=nil)
    @original = original_filename
    @compressed = compressed_filename
    @start_time = Time.now
  end

  def compare_orig_to_comp
    orig_stat = File.stat(original)
    comp_stat = File.stat(compressed)
    @orig_size = "#{orig_stat.size / 1000}K"
    @comp_size = "#{comp_stat.size / 1000}K"
    @pct_comp = "#{'%.1f' % (1-(comp_stat.size.to_f * 100/ orig_stat.size))}%"
    @comp_ratio = "#{'%.2f' % (orig_stat.size.to_f / comp_stat.size)}"
  end

  def compression_statistics
    compare_orig_to_comp
    <<-STATISTICS
________________________________________________________
Original file name     : #{original}
Compressed file name   : #{compressed}
Original file size     : #{orig_size}
Compressed file size   : #{comp_size}
Compression took #{finish} seconds
Compressed file is #{pct_comp} smaller than the original file
Compression Ratio: #{comp_ratio}x
________________________________________________________
    STATISTICS
  end

  def finish
    end_time = Time.now
    difference = end_time - start_time
    '%.2f' % difference
  end
end
