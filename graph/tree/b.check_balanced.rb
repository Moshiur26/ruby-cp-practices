# frozen_string_literal: true

<<~DOC
  Check Balanced: Implement a function to check if a binary tree is balanced. For the purposes of
  this question, a balanced tree is defined to be a tree such that the heights of the two subtrees of any
  node never differ by more than one.
DOC

# Solution: O(N) time and O(H) space, where H is the height of the tree.

# Tree Node Structure
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end
end

def check_height(node)
  return -1 if node.nil?

  left_height = check_height(node.left)
  return -2 if left_height == -2

  right_height = check_height(node.right)
  return -2 if right_height == -2

  height_diff = (left_height - right_height).abs
  return -2 if height_diff > 1

  [left_height, right_height].max + 1
end

def balanced?(node)
  check_height(node) != -2
end

node = Node.new(8)
node.left = Node.new(6)
node.right = Node.new(10)
node.left.left = Node.new(4)
node.left.right = Node.new(7)
node.right.left = Node.new(11)
node.right.right = Node.new(12)
# node.right.right.right = Node.new(13)

puts "balance status: #{balanced?(node)}"

node = Node.new(8)
node.left = Node.new(6)
node.right = Node.new(10)
# node.left.left = Node.new(4)
# node.left.right = Node.new(7)
node.right.left = Node.new(11)
node.right.right = Node.new(12)
node.right.right.right = Node.new(13)

puts "balance status: #{balanced?(node)}"
