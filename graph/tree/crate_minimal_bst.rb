# frozen_string_literal: true

<<~DOC
  Problem:- Minimal Tree: Given a sorted (increasing order) array with unique integer elements, write an
  algorithm to create a binary search tree with minimal height.
DOC

# single node structure of tree
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end
end

# create minimal Binary Search Tree from sorted array
def create_minimal_bst(arr, start_index, end_index)
  return if start_index > end_index

  mid = (start_index + end_index) / 2
  node = Node.new(arr[mid])
  node.left = create_minimal_bst(arr, start_index, mid - 1)
  node.right = create_minimal_bst(arr, mid + 1, end_index)
  node
end

def inorder_traverse(node)
  return if node.nil?

  inorder_traverse(node.left)
  print "#{node.value} "
  inorder_traverse(node.right)
end

arr = [3, 5, 7]
root = create_minimal_bst arr, 0, arr.length - 1

inorder_traverse(root)
