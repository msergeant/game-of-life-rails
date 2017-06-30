class SimulationService
  attr_reader :result
  def initialize(live_cells, generator = nil)
    @live_cells = live_cells
    @generator = generator
  end

  def call
    begin
      @generator ||= GeneratesNextIteration.new(World.new(@live_cells))
      new_cells = @generator.generate.live_cells.map{|p| [p.x, p.y] }

      result = {live_cells: new_cells}.to_json

      OpenStruct.new(success?: true, result: result)
    rescue Exception => e
      OpenStruct.new(success?: false, result: nil, errors: [e.message])
    end
  end
end
