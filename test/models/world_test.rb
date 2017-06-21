require 'test_helper'

class WorldTest < ActiveSupport::TestCase
  test "can be initialized" do
    world = World.new(50, 50, [])
    assert world
  end

  test "alive returns true" do
    world = World.new(50, 50, [[17,45]])
    assert world.alive?( Point.new(17, 45) )
  end

  test "alive returns false" do
    world = World.new(50, 50, [[17,45]])
    refute world.alive?( Point.new(4, 8) )
  end

  test "throws error if live cell is outside of range" do
    assert_raises(ArgumentError) { World.new(50, 50, [[0, 50]]) }
    assert_raises(ArgumentError) { World.new(50, 50, [[50, 0]]) }
  end

  test "throws error if live cell coordinate is less than 0" do
    assert_raises(ArgumentError) { World.new(50, 50, [[-1, 0]]) }
    assert_raises(ArgumentError) { World.new(50, 50, [[0, -1]]) }
  end

  test "returns points of live cells" do
    world = World.new(50, 50, [[0,0], [3,8], [17,45]])
    assert world.live_cells == [Point.new(0, 0), Point.new(3, 8), Point.new(17, 45)]
  end

  test "adds live cell to the list" do
    world = World.new(50, 50, [[0,0]])

    world.add_cell(Point.new(3,8))
    assert world.live_cells == [Point.new(0, 0), Point.new(3, 8)]
  end

  test "ignores live cell already in the list" do
    world = World.new(50, 50, [[0,0]])

    world.add_cell(Point.new(0,0))
    assert world.live_cells == [Point.new(0, 0)]
  end

  test "ignores live cell outside the range" do
    world = World.new(50, 50, [[0,0]])

    world.add_cell(Point.new(0,50))
    assert world.live_cells == [Point.new(0, 0)]
  end
end
