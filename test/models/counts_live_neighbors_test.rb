require 'test_helper'

class CountsLiveNeighborsTest < ActiveSupport::TestCase
  test "can be initialized" do
    counts_live_neighbors = CountsLiveNeighbors.new(World.new(50, 50, []), Point.new(1,1))

    assert counts_live_neighbors
  end

  test "returns correct number" do
    counts_live_neighbors = CountsLiveNeighbors.new(World.new(50, 50, [[0,0], [0,1], [0,2]]), Point.new(1,1))

    assert counts_live_neighbors.count == 3
  end
end
