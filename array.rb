#
print "Stack with push+pop:\n"
arr = []
arr.push(1)
arr.push(3)
arr.push(5)
p arr   #[1, 3, 5]
print "#{arr.pop}\n"  #5
p arr   #[1, 3]

stack = []
stack << 2 # push 2 => stack = [2]
stack << 3 # push 3 => stack = [2, 3]
stack.pop  # pop => 3, stack = [2]

print "Queue with push+shift:\n"
arr = []
arr.push(1)
arr.push(2)
arr.push(3)
p arr   #[1, 2, 3]
print "#{arr.shift}\n"  #1
# print "#{arr.pop}\n"  #3
p arr   #[3, 1]

# we have a Queue class
queue = Queue.new
queue << 2 # push 2 => queue = [2]
queue << 3 # push 3 => queue = [2, 3] (just a representation, it will be an object though)
queue.pop # pop 2

#Shift/Unshift
print "Shift/Unshift:\n"
arr = []
arr.unshift(1)
arr.unshift(2)
arr.unshift(3)
p arr   #[3, 2, 1]
print "#{arr.shift}\n"  #3

#Dynamic Array
print "Dynamic Array:\n"
arr = [[2, 3], [1], [4, 5, 6]]
arr[1] << 1
p arr           #[[2, 3], [1, 1], [4, 5, 6]]
print(arr[2].count)   #3
