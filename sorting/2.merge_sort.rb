def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..-1]

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first <= right.first
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end

# Example usage:
arr = [12, 4, 7, 2, 10, 15, 3, 9]
sorted_arr = merge_sort(arr)
puts "Sorted Array: #{sorted_arr}"
