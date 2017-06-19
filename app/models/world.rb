class World
  def initialize(length, width, live_cells)
    @length = length
    @width = width
    @live_cells = live_cells
  end

  def alive?(point)
    @live_cells.include?( [point.x, point.y] )
  end
end
