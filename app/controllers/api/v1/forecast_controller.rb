class Api::V1::ForecastController < ApplicationController
  before_action :check_location

  def index
    forecast = ForecastFacade.get_forecast(@coordinates[:lat], @coordinates[:lng])
    render json: ForecastSerializer.weather(forecast)
  end

  private

  def check_location
    if params[:location].present?
      @coordinates = MapFacade.get_coordinates(params[:location])
    else
      render status: 404
    end
  end
end
