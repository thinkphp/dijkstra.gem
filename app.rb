require 'dijkstra'

r = [[1, 2, 1],
     [1, 3, 9],
     [1, 5, 3],
     [2, 4, 3],
     [2, 3, 7],
     [4, 3, 2],
     [4, 1, 1],
     [5, 2, 4],
     [5, 4, 2]]

start_point = 1 # starting node
end_point = 3 # arrival node

ob = Dijkstra.new(start_point, end_point, r)

puts "Cost = #{ob.cost}"
puts "Shortest Path from #{start_point} to #{end_point} = #{ob.shortest_path}"

ob.write_to_file('shortestpath.out')
