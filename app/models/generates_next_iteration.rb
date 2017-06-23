class GeneratesNextIteration
  def initialize(world)
    @world = world
  end

  def generate
    new_world = World.new([])
    ListsPointsToCheck.new(@world).list.each do |point|
      alive = @world.alive?(point)
      live_neighbor_count = CountsLiveNeighbors.new(@world, point).count

      if alive && live_neighbor_count == 2
        new_world.add_cell(point)
      elsif live_neighbor_count == 3
        new_world.add_cell(point)
      end
    end

    new_world
  end
end
