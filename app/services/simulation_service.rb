class SimulationService
  attr_reader :result
  def initialize(live_cells, generator = nil)
    @live_cells = live_cells
    @generator = generator
  end

  def simulate
    begin
      world = World.new(50, 50, @live_cells)
      @generator ||= GeneratesNextIteration.new(world)
      new_cells = @generator.generate.live_cells.map{|p| [p.x, p.y] }

      @result = {live_cells: new_cells}.to_json

      true
    rescue Exception => e
      @result = {error: e.message}.to_json

      false
    end
  end
end
