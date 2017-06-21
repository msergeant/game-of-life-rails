class World
  def initialize(length, width, live_cells)
    @length = length
    @width = width
    @live_cells = test_cell_validity(live_cells)
  end

  def alive?(point)
    @live_cells.include?( [point.x, point.y] )
  end

  def live_cells
    @live_cells.map{|x,y| Point.new(x, y) }
  end

  def add_cell(point)
    @live_cells << [point.x, point.y] unless outside_range?(point) || alive?(point)
  end

  private

  def test_cell_validity(cells)
    if cells.any?{|x,y| outside_range?(Point.new(x,y)) }
      raise ArgumentError.new("Cell coordinates must be inside boundaries")
    end

    cells
  end

  def outside_range?(point)
    x,y = point.x, point.y
    x > (@length - 1) || y > (@width - 1) || x < 0 || y < 0
  end
end
