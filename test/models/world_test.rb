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
end
