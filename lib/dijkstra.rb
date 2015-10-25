# Class that calculates the smallest path using
# Dijkstra Algorithm
class Dijkstra
  # constructor of the class
  def initialize(startpoint, endpoint, matrix_of_road)
    # start node
    @start = startpoint

    # end node
    @end = endpoint

    @path = []

    @infinit = Float::INFINITY

    # Recriating matrix_of_road to avoid passing the number
    # of vertices in the first element.
    vertices = number_of_vertices(matrix_of_road.dup)
    matrix_of_road =  matrix_of_road.unshift([vertices])

    read_and_init(matrix_of_road)

    # Dijkstra's algorithm in action and good luck
    dijkstra
  end

  # Calculates the number of vertices (unique elements)
  # in a matrix of road
  def number_of_vertices(matrix)
    # Ignoring the weight element (third element)
    matrix = matrix.collect { |x| [x[0], x[1]] }
    # Merging all the path arrays
    matrix = matrix.zip.flatten.compact
    # All the vertices
    @nodes = matrix.uniq.dup
    # Returning the number of unique elements (vertices)
    matrix.uniq.count
  end

  # This method determines the minimum cost of the shortest path
  def cost
    @r[@end]
  end

  # get the shortest path
  def shortest_path
    road(@end)
    @path
  end

  def road(node)
    road(@f[node]) if @f[node] != 0
    @path.push(node)
  end

  def dijkstra
    min = @infinit
    pos_min = @infinit

    @nodes.each do |i|
      @r[i] = @road[[@start, i]]
      @f[i] = @start if i != @start && @r[i] < @infinit
    end

    @s[@start] = 1

    @nodes[0..@nodes.size - 2].each do
      min = @infinit

      @nodes.each do |i|
        if @s[i] == 0 && @r[i] < min
          min = @r[i]
          pos_min = i
        end
      end

      @s[pos_min] = 1

      @nodes.each do|j|
        if @s[j] == 0
          if @r[j] > @r[pos_min] + @road[[pos_min, j]]
            @r[j] = @r[pos_min] + @road[[pos_min, j]]
            @f[j] = pos_min
          end
        end
      end
    end
  end

  def read_and_init(arr)
    n = arr.size - 1

    @road = Hash.new(@nodes)
    @r = Hash.new(@nodes)
    @s = Hash.new(@nodes)
    @f = Hash.new(@nodes)

    @nodes.each do |i|
      @r[i] = 0
    end

    @nodes.each do |i|
      @s[i] = 0
    end

    @nodes.each do |i|
      @f[i] = 0
    end

    @nodes.each do |i|
      @nodes.each do |j|
        if i == j
          @road[[i, j]] = 0
        else
          @road[[i, j]] = @infinit
        end
      end
    end

    (1..n).each do |i|
      x = arr[i][0]
      y = arr[i][1]
      c = arr[i][2]
      @road[[x, y]] = c
    end
  end

  # Write the result on file
  def write_to_file(filename)
    f = File.open(filename, 'w')
    out = "Cost -> #{@r[@end]}\nShortest Path -> #{@path}"
    f.write(out)
    f.close
  end
end
