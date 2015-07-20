require 'minitest/autorun'
require_relative '../lib/dijkstra.rb'

# Unity tests for Dijkstra implementation
class DijkstraTest < MiniTest::Test
  def matrix_of_road
    [[1, 2, 10], [2, 4, 15],
     [1, 3, 20], [3, 4, 30], [2, 5, 50], [4, 5, 30]]
  end

  def test_number_of_vertices
    # Just create a dumb object to enable the calling of the
    # number_of_vertices function
    dijk = Dijkstra.new(1, 4, matrix_of_road)
    a = [[1, 2, 10], [2, 4, 15], [1, 3, 20], [3, 4, 30], [2, 5, 50], [4, 5, 30]]
    assert_equal(5, dijk.number_of_vertices(a))

    b = [[1, 2, 10], [2, 4, 15], [1, 3, 20], [3, 4, 30], [2, 5, 50], [4, 5, 30],
         [5, 6, 20], [6, 7, 50]]
    assert_equal(7, dijk.number_of_vertices(b))

    c = [[1, 2, 10], [2, 4, 15], [1, 3, 20], [3, 4, 30], [2, 5, 50], [4, 5, 30],
         [5, 10, 20], [7, 20, 50], [9, 20, 30]]
    assert_equal(9, dijk.number_of_vertices(c))
  end

  def test_dijkstra
    dijk = Dijkstra.new(1, 4, matrix_of_road)
    assert_equal(25, dijk.cost)
    assert_equal([1, 2, 4], dijk.shortest_path)

    dijk = Dijkstra.new(1, 5, matrix_of_road)
    assert_equal(55, dijk.cost)
    assert_equal([1, 2, 4, 5], dijk.shortest_path)

    dijk = Dijkstra.new(2, 5, matrix_of_road)
    assert_equal(45, dijk.cost)
    assert_equal([2, 4, 5], dijk.shortest_path)
  end
end
