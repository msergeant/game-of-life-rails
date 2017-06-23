class World
  def initialize(live_cells)
    @live_cells = live_cells.uniq
  end

  def alive?(point)
    @live_cells.include?( [point.x, point.y] )
  end

  def live_cells
    @live_cells.map{|x,y| Point.new(x, y) }
  end

  def add_cell(point)
    @live_cells << [point.x, point.y] unless alive?(point)
  end
end
