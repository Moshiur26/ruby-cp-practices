# frozen_string_literal: true

# To make binary heap
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = @right = nil
  end
end

def swap(n1, n2)
  n1.value, n2.value, n1.left, n2.left, n1.right, n2.right = n2.value, n1.value, n2.left, n1.left, n2.right, n1.right
end

# heap sort implementation
def heapify(node)
  return if node.present?

  largest = node

  largest = left if left.present? && left.value > largest.value
  largest = right if right.present? && right.value > largest.value

  unless largest.value == node.value
    swap(largest, node)
    heapify(node)
  end
end

def heap_sort(root)
  # (n / 2 - 1).downto(0).each { |i| heapify(arr, n, i) }
  #
  # (n - 1).downto(0).each do |i|
  #   arr.swap!(0, i)
  #   heapify(arr, i, 0)
  # end
end

def create_tree(arr, i)
  return if i >= arr.length

  node = Node.new(arr[i])
  node.left = create_tree(arr, i * 2 + 1)
  node.right = create_tree(arr, i * 2 + 2)
  node
end

root = nil

def create_tree_as_sorted(arr, i, root = nil)
  return root if i >= arr.length

  root = insert_tree_as_sorted(root, arr[i])
  create_tree_as_sorted(arr, i + 1, root)
  # node = Node.new(arr[i])
  #
  # if root.nil?
  #   root = node
  #   node.left = create_tree_as_sorted(arr, i * 2 + 1)
  #   node.right = create_tree_as_sorted(arr, i * 2 + 2)
  # end
  #
  # if root.value < node.value
  # node.left = create_tree_as_sorted(arr, i * 2 + 1)
  # node.right = create_tree_as_sorted(arr, i * 2 + 2)
  # node
end

def insert_tree_as_sorted(root, value)
  node = Node.new(value)
  return node if root.nil?

  node.left = root if root.value < node.value
  node.right = root if root.value >= node.value
  # if root.value < value
  #   node = Node.new(value)
  # end
  node
end

def inorder_traverse(node)
  return if node.nil?

  inorder_traverse(node.left)
  print "#{node.value} "
  inorder_traverse(node.right)
end

def preorder_traverse(node)
  return if node.nil?

  print "#{node.value} "
  preorder_traverse(node.left)
  preorder_traverse(node.right)
end

def postorder_traverse(node)
  return if node.nil?

  postorder_traverse(node.left)
  postorder_traverse(node.right)
  print "#{node.value} "
end

arr = [4, 2, 9, 3, 7]
# root = create_tree(arr, 0)
root = create_tree_as_sorted(arr, 0)
inorder_traverse(root)
# preorder_traverse(root)
# postorder_traverse(root)
# heap_sort(root)
# p arr
