class ListsPointsToCheck
  def initialize(world)
    @world = world
  end

  def list
    points = @world.live_cells.flat_map{|p|
      ListsNeighbors.new(p).list + [p]
    }

    points.uniq {|p| [p.x, p.y] }
  end
end
