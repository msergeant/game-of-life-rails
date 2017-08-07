class World
  def initialize(live_cells)
    @live_cells = live_cells.uniq.sort
  end

  def alive?(point)
    @live_cells.each do |x,y|
      return true if point.x.eql?(x) && point.y.eql?(y)
      return false if x > point.x
    end

    false
  end

  def live_cells
    @live_cells.map{|x,y| Point.new(x, y) }
  end

  def add_cell(point)
    @live_cells << [point.x, point.y] unless alive?(point)
  end
end
