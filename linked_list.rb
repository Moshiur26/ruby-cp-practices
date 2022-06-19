# A very simple representation
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList

  def initialize(value)
    @head = Node.new(value)
  end

  def add(value)
    current = @head
    while !current.next_node.nil?
      current = current.next_node
    end
    current.next_node = Node.new(value)
  end

  def print_all
    current = @head
    while !current.nil?
      print "#{current.value} "
      current = current.next_node
    end
    print "\n"
  end
end

ll = LinkedList.new(1)
ll.add(10)
ll.add(20)
ll.print_all
