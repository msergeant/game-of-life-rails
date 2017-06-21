require 'test_helper'

class GeneratesNextIterationTest < ActiveSupport::TestCase
  test "can be initialized" do
    generates_next_iteration = GeneratesNextIteration.new(World.new(50, 50, []))

    assert generates_next_iteration
  end

  test "returns empty world" do
    generates_next_iteration = GeneratesNextIteration.new(World.new(50, 50, []))

    result = generates_next_iteration.generate
    assert  result.live_cells == []
  end

  test "returns same size world" do
    generates_next_iteration = GeneratesNextIteration.new(World.new(20, 80, []))

    result = generates_next_iteration.generate
    assert  result.length == 20
    assert  result.width == 80
  end

  test "returns proper live cell list for 10 cell row" do
    initial_points = [
      [7,0], [7,1], [7,2], [7,3], [7,4], [7,5], [7,6], [7,7], [7,8], [7,9]
    ]
    generates_next_iteration = GeneratesNextIteration.new(World.new(50, 50, initial_points))

    expected_points = [
      Point.new(6, 1), Point.new(6,2), Point.new(6,3), Point.new(6,4), Point.new(6,5), Point.new(6,6), Point.new(6,7), Point.new(6,8),
      Point.new(7, 1), Point.new(7,2), Point.new(7,3), Point.new(7,4), Point.new(7,5), Point.new(7,6), Point.new(7,7), Point.new(7,8),
      Point.new(8, 1), Point.new(8,2), Point.new(8,3), Point.new(8,4), Point.new(8,5), Point.new(8,6), Point.new(8,7), Point.new(6,8)
    ]

    result_points = generates_next_iteration.generate.live_cells
    assert result_points.count == expected_points.count
    assert expected_points.all? {|p| result_points.include?(p) }
  end
end
