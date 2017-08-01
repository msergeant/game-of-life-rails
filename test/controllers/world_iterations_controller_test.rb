require 'test_helper'

class WorldIterationsControllerTest < ActionDispatch::IntegrationTest
  test "should return next iteration" do
    service = MiniTest::Mock.new
    service.expect(:simulate, OpenStruct.new(success?: true, result: {live_cells: [[0,0]]}))

    SimulationService.stub :new, service do
      get world_iterations_url, as: :json, params: {live_cells: [[0,0], [0,9]]}
    end
    service.verify
    assert_response :ok
  end

  test "should return error" do
    service = MiniTest::Mock.new
    service.expect(:simulate, OpenStruct.new(success?: false, errors: ['Bad request']))

    SimulationService.stub :new, service do
      get world_iterations_url, as: :json, params: {live_cells: [[0,0], [0,9]]}
    end
    service.verify
    assert_response :bad_request
  end
end
