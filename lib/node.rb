class Node
  attr_accessor :char, :freq, :left, :right, :bits

  def initialize(char, freq, left=nil, right=nil, bits='')
    @char = char
    @freq = freq
    @left = left
    @right = right
    @bits = bits
  end
end
