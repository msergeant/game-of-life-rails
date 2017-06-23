class WorldIterationsController < ApplicationController
  def show
    service = SimulationService.new(params[:live_cells])
    if(service.simulate)
      status = :ok
    else
      status = :bad_request
    end
    render json: service.result, status: status
  end
end
