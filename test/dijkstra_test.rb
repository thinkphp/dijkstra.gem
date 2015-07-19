require 'minitest/autorun'
require_relative '../lib/dijkstra.rb'

# Unity tests for Dijkstra implementation
class DijkstraTest < MiniTest::Test
  def matrix_of_road
    [[5], [1, 2, 10], [2, 4, 15],
     [1, 3, 20], [3, 4, 30], [2, 5, 50], [4, 5, 30]]
  end

  def test_dijkstra
    dijk = Dijkstra.new(1, 4, matrix_of_road)
    assert_equal(25, dijk.getCost)
    assert_equal([1, 2, 4], dijk.getShortestPath)

    dijk = Dijkstra.new(1, 5, matrix_of_road)
    assert_equal(55, dijk.getCost)
    assert_equal([1, 2, 4, 5], dijk.getShortestPath)

    dijk = Dijkstra.new(2, 5, matrix_of_road)
    assert_equal(45, dijk.getCost)
    assert_equal([2, 4, 5], dijk.getShortestPath)
  end
end
