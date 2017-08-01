class WorldIterationsController < ApplicationController
  def show
    result = SimulationService.new(params[:live_cells]).simulate
    if(result.success?)
      status = :ok
      json_result = result.result
    else
      status = :bad_request
      json_result = {error: result.errors[0]}.to_json
    end
    render json: json_result, status: status
  end
end
