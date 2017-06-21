class ListsNeighbors
  def initialize(point)
    @point = point
  end

  def list
    [
      Point.new(@point.x - 1, @point.y - 1), Point.new(@point.x, @point.y - 1), Point.new(@point.x + 1, @point.y - 1),
      Point.new(@point.x - 1, @point.y),                                        Point.new(@point.x + 1, @point.y),
      Point.new(@point.x - 1, @point.y + 1), Point.new(@point.x, @point.y + 1), Point.new(@point.x + 1, @point.y + 1)
    ]
  end
end
