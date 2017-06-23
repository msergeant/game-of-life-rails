require 'test_helper'

class ListsPointsToCheckTest < ActiveSupport::TestCase
  test "can be initialized" do
    lists_points_to_check = ListsPointsToCheck.new(World.new([]))

    assert lists_points_to_check
  end

  test "lists nothing for empty world" do
    lists_points_to_check = ListsPointsToCheck.new(World.new([]))

    assert lists_points_to_check.list == []
  end

  test "lists points of interest" do
    lists_points_to_check = ListsPointsToCheck.new(World.new([[5,7]]))
    correct_list = [
      Point.new(4, 6), Point.new(5, 6), Point.new(6, 6),
      Point.new(4, 7), Point.new(5, 7), Point.new(6, 7),
      Point.new(4, 8), Point.new(5, 8), Point.new(6, 8)
    ]

    generated_list = lists_points_to_check.list
    assert generated_list.count == correct_list.count
    assert generated_list.all? {|p| correct_list.include?(p) }
  end

  test "lists points of interest without repeats" do
    lists_points_to_check = ListsPointsToCheck.new(World.new([[5,7], [6, 7]]))
    correct_list = [
      Point.new(4, 6), Point.new(5, 6), Point.new(6, 6), Point.new(7, 6),
      Point.new(4, 7), Point.new(5, 7), Point.new(6, 7), Point.new(7, 7),
      Point.new(4, 8), Point.new(5, 8), Point.new(6, 8), Point.new(7, 8),
    ]

    generated_list = lists_points_to_check.list
    assert generated_list.count == correct_list.count
    assert generated_list.all? {|p| correct_list.include?(p) }
  end
end
