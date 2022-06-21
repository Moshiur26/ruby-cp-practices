class Node
  attr_accessor :value, :left, :right

  def initialize(data)
    @value = data
    @left = @right = nil
  end
end

root = Node.new(2)
root.left = Node.new(3)
root.right = Node.new(4)
root.left.left = Node.new(5)
root.left.right = Node.new(6)

print "#{root.value} #{root.left.value} #{root.right.value} #{root.left.left.value}\n"
