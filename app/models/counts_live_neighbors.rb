class CountsLiveNeighbors
  def initialize(world, point)
    @world = world
    @point = point
  end

  def count
    ListsNeighbors.new(@point).list.reduce(0) do |acc, p|
      if @world.alive?(p)
        acc + 1
      else
        acc
      end
    end
  end
end
