require 'test_helper'

class ListsNeighborsTest < ActiveSupport::TestCase
  test "can be initialized" do
    lists_neighbors = ListsNeighbors.new(Point.new(0,0))

    assert lists_neighbors
  end

  test "returns 8 neighbors of given point" do
    lists_neighbors = ListsNeighbors.new(Point.new(5,5))

    returned_list = lists_neighbors.list

    assert returned_list.count == 8
    assert returned_list == [
      Point.new(4, 4), Point.new(5, 4), Point.new(6, 4),
      Point.new(4, 5),                  Point.new(6, 5),
      Point.new(4, 6), Point.new(5, 6), Point.new(6, 6)
    ]
  end

end
