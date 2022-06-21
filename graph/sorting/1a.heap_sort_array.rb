# frozen_string_literal: true

# array mixin
class Array
  def swap!(a, b)
    self[a], self[b] = self[b], self[a]
  end
end

# heap sort implementation
def heapify(arr, n, i)
  largest = i
  left = i * 2 + 1
  right = i * 2 + 2

  largest = left if left < n && arr[left] > arr[largest]
  largest = right if right < n && arr[right] > arr[largest]

  unless largest == i
    arr.swap!(i, largest)
    heapify(arr, n, largest)
  end
end

def heap_sort(arr, n)
  (n / 2 - 1).downto(0).each { |i| heapify(arr, n, i) }

  (n - 1).downto(0).each do |i|
    arr.swap!(0, i)
    heapify(arr, i, 0)
  end
end

arr = [4, 2, 9, 3, 7]
heap_sort(arr, arr.length)
p arr
