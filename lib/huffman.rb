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

class BinaryTree
  attr_reader :char_freq_hash

  def initialize(char_freq_hash)
    @char_freq_hash = char_freq_hash
    converted_nodes = create_nodes(char_freq_hash)
    node_tree = build_tree(converted_nodes)
    return generate_keys(node_tree)
  end

  def create_nodes(char_frequency)
    node_array = []
    char_frequency.each do |char, freq|
      new_node = Node.new(char, freq)
      node_array << new_node
    end
    node_array
  end

  def build_tree(node_array)
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

  def traverse_binary_tree(node, results)
    if node.left == nil && node.right == nil
      results[node.char] = node.bits
    else
      node.left.bits = node.bits + '0'
      node.right.bits = node.bits + '1'
      traverse_binary_tree(node.left, results)
      traverse_binary_tree(node.right, results)
    end
  end

  def generate_keys(node)
    results_hash = {}
    traverse_binary_tree(node, results_hash)
    results_hash
  end
end
