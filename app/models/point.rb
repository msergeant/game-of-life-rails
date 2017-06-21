class Point
  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def ==(another_point)
    @x == another_point.x && @y == another_point.y
  end
end
