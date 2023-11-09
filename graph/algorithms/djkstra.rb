require 'priority_queue'

def dijkstra(graph, start)
  # Set initial distances to infinity for all nodes
  distances = {}
  graph.keys.each { |node| distances[node] = Float::INFINITY }
  distances[start] = 0

  # Initialize priority queue with start node and its distance
  pq = PriorityQueue.new
  pq[start] = 0

  while pq.size > 0
    current_node, current_distance = pq.delete_min

    next if current_distance > distances[current_node]

    graph[current_node].each do |neighbor, weight|
      total_distance = distances[current_node] + weight

      if total_distance < distances[neighbor]
        distances[neighbor] = total_distance
        pq[neighbor] = total_distance
      end
    end
  end

  distances
end

# Example graph as an adjacency list
graph = {
  'A' => { 'B' => 4, 'C' => 2 },
  'B' => { 'A' => 4, 'C' => 5, 'D' => 10 },
  'C' => { 'A' => 2, 'B' => 5, 'D' => 3 },
  'D' => { 'B' => 10, 'C' => 3 }
}

start_node = 'A'
result = dijkstra(graph, start_node)

puts "Shortest distances from node '#{start_node}':"
result.each { |node, distance| puts "To node '#{node}' -> Distance: #{distance}" }
