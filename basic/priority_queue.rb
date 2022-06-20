# Heaps/ Priority Queue A min heap/priority queue functionality can be achieved using sorted set.
pq = SortedSet.new([3]) #=> #<SortedSet: {3}>
pq.add(1) #=> #<SortedSet: {1, 3}>
pq.add(6) #=> #<SortedSet: {1, 3, 6}>

#Deletion(top priority element)
top = pq.first #1
pq.delete(top) #=> #<SortedSet: {3, 6}>, top is '1'
top = pq.first #3
pq.delete(top) #=> #<SortedSet: {6}>

p pq # #<Set: {1, 2, 3}>
