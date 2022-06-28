# frozen_string_literal: true

numbers = [5, 3, 2, 1]
p numbers.sort
# [1,2,3,5]

# NOTE: Customized Sorting With sort_by
strings = %w[foo test blog a]
p strings.sort_by(&:length)
# ["a", "foo", "test", "blog"]

def sort_by_capital_word(text)
  text
    .split
    .sort_by { |w| w[0].match?(/[A-Z]/) ? 0 : 1 }
    .join(' ')
end
p sort_by_capital_word('calendar Cat tap Lamp')
# "Cat Lamp calendar tap"

# NOTE: Sort in Reverse Order
strings = %w[foo test blog a]
p strings.sort { |a,b| a.length <=> b.length }
# ["a", "foo", "test", "blog"]


strings = %w[foo test blog a]
p strings.sort_by { |str| -str.length }
# ["blog", "test", "foo", "a"]


# NOTE: Alphanumeric Sorting
music = %w[21.mp3 10.mp3 5.mp3 40.mp3]
p music.sort
# ["10.mp3", "21.mp3", "40.mp3", "5.mp3"]

p music.sort_by { |s| s.scan(/\d+/).first.to_i }
# ["5.mp3", "10.mp3", "21.mp3", "40.mp3"]


# NOTE: Sort Hashes in Ruby
hash = {coconut: 200, orange: 50, bacon: 100}
p hash.sort_by(&:last)
# [[:orange, 50], [:bacon, 100], [:coconut, 200]]


# NOTE: Sorting By Multiple Values
Event = Struct.new(:name, :date)
events = []
events << Event.new('book sale', Time.now)
events << Event.new('course sale', Time.now)
events << Event.new('new subscriber', Time.now)
# events << Event.new('course sale', Time.now + 1.day)

p events.sort_by { |event| [event.date, event.name] }


# NOTE: QuickSort Implementation
def quick_sort(list)
  return [] if list.empty?

  groups = list.group_by { |n| n <=> list.first }
  less_than    = groups[-1] || []
  first        = groups[0]  || []
  greater_than = groups[1]  || []
  quick_sort(less_than) + first + quick_sort(greater_than)
end
p quick_sort [3, 7, 2, 1, 8, 12]
# [1, 2, 3, 7, 8, 12]
