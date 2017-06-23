require 'test_helper'

class WorldTest < ActiveSupport::TestCase
  test "can be initialized" do
    world = World.new([])
    assert world
  end

  test "alive returns true" do
    world = World.new([[17,45]])
    assert world.alive?( Point.new(17, 45) )
  end

  test "alive returns false" do
    world = World.new([[17,45]])
    refute world.alive?( Point.new(4, 8) )
  end

  test "returns points of live cells" do
    world = World.new([[0,0], [3,8], [17,45]])
    assert world.live_cells == [Point.new(0, 0), Point.new(3, 8), Point.new(17, 45)]
  end

  test "adds live cell to the list" do
    world = World.new([[0,0]])

    world.add_cell(Point.new(3,8))
    assert world.live_cells == [Point.new(0, 0), Point.new(3, 8)]
  end

  test "ignores live cell already in the list" do
    world = World.new([[0,0]])

    world.add_cell(Point.new(0,0))
    assert world.live_cells == [Point.new(0, 0)]
  end
end
