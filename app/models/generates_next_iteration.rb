class GeneratesNextIteration
  def initialize(world)
    @world = world
  end

  def generate
    new_points = []
    ListsPointsToCheck.new(@world).list.each do |point|
      alive = @world.alive?(point)
      live_neighbor_count = CountsLiveNeighbors.new(@world, point).count

      if alive && live_neighbor_count == 2
        new_points << [point.x, point.y]
      elsif live_neighbor_count == 3
        new_points << [point.x, point.y]
      end
    end

    World.new(new_points)
  end
end
