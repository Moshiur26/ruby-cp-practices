def quick_sort(arr)
  return arr if arr.length <= 1

  pivot = arr.delete_at(arr.length / 2)
  less_than_pivot, greater_than_pivot = arr.partition { |element| element <= pivot }

  quick_sort(less_than_pivot) + [pivot] + quick_sort(greater_than_pivot)
end

# Example usage:
array = [4, 91, 1, 35, 9, 21, 5, 81, 6]
sorted_array = quick_sort(array)
puts "Sorted array: #{sorted_array}"
