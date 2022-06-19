G = [] #Array.new(10)
puts "Enter Number of Edge:"
n = gets.chomp.to_i
n.times do|i|
  input = gets.chomp.split().map { |e| e.to_i  }
  a, b = input
  G[a].nil? ? G[a] = [b] : G[a] << b
  G[b].nil? ? G[b] = [a] : G[b] << a
end

p G
puts G.count
