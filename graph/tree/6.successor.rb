# frozen_string_literal: true

<<~DOC
  Successor: Write an algorithm to find the "next" node (i.e., in-order successor) of a given node in a
  binary search tree. You may assume that each node has a link to its parent.
DOC

# Tree node structure
class Node
  attr_accessor :value, :left, :right, :parent

  def initialize(_value, _parent = nil)
    @value = _value
    @parent = _parent
    @left = nil
    @right = nil
  end
end

def inorder_successor(node)
  return if node.nil?
  return left_most_child(node.right) unless node.right.nil?

  current = node
  parent = current.parent
  until parent.nil? || (parent.left == current)
    current = parent
    parent = current.parent
  end

  parent
end

def left_most_child(x)
  return if x.nil?

  x = x.left until x.left.nil?
  x
end

node = Node.new(8)
node.left = Node.new(6, node)
node.right = Node.new(10, node)
node.left.left = Node.new(4, node.left)
node.left.right = Node.new(7, node.left)
node.right.left = Node.new(9, node.right)
node.right.right = Node.new(11, node.right)

# result = left_most_child(node)
result = inorder_successor(node.left.right)
puts "Next Node: #{result.value}" unless result.nil?
