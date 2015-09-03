require 'pry'

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

class Huffman
  def self.build_tree(node_array)
    if node_array.length > 1
      node = node_array[0]
      next_node = node_array[1]
      char1 = node.char
      char2 = next_node.char
      parent_char = char1 + char2
      freq1 = node.freq
      freq2 = next_node.freq
      parent_freq = freq1 + freq2
      parent_node = Node.new(parent_char, parent_freq, node, next_node)
      node_array.shift(2)
      node_array.unshift(parent_node)
      node_array.sort_by! { |node| node.freq }
      build_tree(node_array)
    else
      node_array.first
    end
  end

  def self.traverse_binary_tree(node, results)
    if node.left == nil && node.right == nil
      results[node.char] = node.bits
    else
      node.left.bits = node.bits + '0'
      node.right.bits = node.bits + '1'
      traverse_binary_tree(node.left, results)
      traverse_binary_tree(node.right, results)
    end
  end

  def self.create_keys(node)
    results_hash = {}
    self.traverse_binary_tree(node, results_hash)
    results_hash
  end
end
