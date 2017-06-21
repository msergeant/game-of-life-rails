require 'minitest/mock'
require 'test_helper'

class SimulationServiceTest < ActiveSupport::TestCase
  test "can be initialized" do
    simulation_service = SimulationService.new([], Object.new)

    assert simulation_service
  end

  test "it converts point list into json response" do
    generator = MiniTest::Mock.new
    fake_world = MiniTest::Mock.new
    generator.expect :generate, fake_world
    fake_world.expect :live_cells, [Point.new(3,4), Point.new(5,6)]

    simulation_service = SimulationService.new([], generator)

    assert simulation_service.call == true
    assert simulation_service.result == {live_cells: [[3,4], [5,6]]}.to_json
  end

  test "it returns false when there is an error" do
    generator = MiniTest::Mock.new
    generator.expect(:generate, nil){ raise ArgumentError.new("Test Message") }

    simulation_service = SimulationService.new([], generator)

    assert simulation_service.call == false
    assert simulation_service.result == {error: "Test Message"}.to_json
  end
end
