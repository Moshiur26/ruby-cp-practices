# frozen_string_literal: true

<<~DOC
  Validate BST: Implement a function to check if a binary tree is a binary search tree.

  Solution: In-order traversal (its takes up a bit of extra memory and can't handle duplicate
  values in the tree properly).
DOC

# Tree Node Structure
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end
end

# Global variable
$index = 0
def copy_bst(node, arr)
  return if node.nil?

  copy_bst(node.left, arr)
  arr[$index] = node.value
  $index += 1
  copy_bst(node.right, arr)
end

def check_bst(node)
  arr = []
  copy_bst(node, arr)
  p arr
  # NOTE: This <=> symbol is called “the spaceship operator” & it’s a method you can implement in your class.
  # It should return 1 (greater than), 0 (equal) or -1 (less than).
  #
  # arr.each_cons(2).all? { |a, b| (a <=> b) <= 0 } # check sorted or not (here <=> operator use for instance)
  arr.each_cons(2).all? { |a, b| a <= b } # check sorted or not
end

node = Node.new(8)
node.left = Node.new(6)
node.right = Node.new(10)
node.left.left = Node.new(4)
node.left.right = Node.new(7)
node.right.left = Node.new(9)
node.right.right = Node.new(11)

puts "bst status: #{check_bst(node)}"
