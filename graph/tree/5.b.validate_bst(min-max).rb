# frozen_string_literal: true

<<~DOC
  Validate BST: Implement a function to check if a binary tree is a binary search tree.

  Solution: Using min-max
DOC

# Tree Node Structure
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end
end

def check_bst(node, min = nil, max = nil)
  return true if node.nil?

  return false if (min && node.value <= min) || (max && node.value >= max)
  return false unless check_bst(node.left, min, node.value) && check_bst(node.right, node.value, max)

  true
end

node = Node.new(8)
node.left = Node.new(6)
node.right = Node.new(10)
node.left.left = Node.new(4)
node.left.right = Node.new(7)
node.right.left = Node.new(9)
node.right.right = Node.new(11)

puts "bst status: #{check_bst(node)}"
