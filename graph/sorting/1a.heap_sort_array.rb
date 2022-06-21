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
  i = n/2 -1
  while i >= 0
    heapify(arr, n, i)
    i -= 1
  end

  i = n - 1
  while i >= 0
    arr.swap!(0, i)
    heapify(arr, i, 0)
    i -= 1
  end
end

arr = [4, 2, 9, 3, 7]
heap_sort(arr, 5)
p arr
