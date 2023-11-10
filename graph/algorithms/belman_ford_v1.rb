class Graph
  attr_accessor :vertices, :edges

  def initialize(vertices, edges)
    @vertices = vertices
    @edges = edges
  end

  def bellman_ford(source)
    # Initialize distance array and set the distance to the source as 0
    distance = {}
    @vertices.each do |vertex|
      distance[vertex] = Float::INFINITY
    end
    distance[source] = 0

    # Relax all edges |V| - 1 times
    (@vertices.length - 1).times do
      @edges.each do |edge|
        u, v, weight = edge
        if distance[u] + weight < distance[v]
          distance[v] = distance[u] + weight
        end
      end
    end

    # Check for negative-weight cycles
    @edges.each do |edge|
      u, v, weight = edge
      if distance[u] + weight < distance[v]
        puts "Graph contains a negative-weight cycle"
        return
      end
    end

    # Print the shortest distances from the source to all vertices
    @vertices.each do |vertex|
      puts "Distance from #{source} to #{vertex}: #{distance[vertex]}"
    end
  end
end

# Example usage:
vertices = ["A", "B", "C", "D", "E"]
edges = [
  ["A", "B", 2],
  ["A", "C", 4],
  ["B", "C", 1],
  ["B", "D", 7],
  ["C", "D", 3],
  ["D", "E", 1],
  ["C", "E", 5],
]

graph = Graph.new(vertices, edges)
graph.bellman_ford("A")
