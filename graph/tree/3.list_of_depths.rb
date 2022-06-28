# frozen_string_literal: true

<<~DOC
  List of Depths: Given a binary tree, design an algorithm which creates a linked list of all the nodes
  at each depth (e.g., if you have a tree with depth D, you'll have D linked lists).
DOC

# Single node structure of tree
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end
end

# Linklist structure
class LinkNode
  attr_accessor :value, :next

  def initialize(value)
    @value = value
  end
end

def list_of_depths(root, lists, level)
  return lists if root.nil?

  if lists.length == level
    lists << LinkNode.new(root.value)
  else
    link_node = LinkNode.new(root.value)
    link_node.next = lists[level]
    lists[level] = link_node
  end
  list_of_depths(root.left, lists, level + 1)
  list_of_depths(root.right, lists, level + 1)
  lists
end

def print_list(node)
  return unless node

  print "#{node.value} "
  print_list(node.next)
end

node = Node.new(8)
node.left = Node.new(6)
node.right = Node.new(10)
node.left.left = Node.new(4)
node.left.right = Node.new(7)
node.right.left = Node.new(11)
node.right.right = Node.new(12)

lists = list_of_depths(node, [], 0)


lists.each_with_index do |list, i|
  print "level-#{i} : "
  print_list list
  puts ''
end
