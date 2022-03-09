class Api::V1::RoadtripController < ApplicationController

  def create


      user = User.find_by(auth_token: roadtrip_params[:api_key])

      origin = params[:origin]
      destination = params[:destination]
      data = RoadtripFacade.get_route(params[:origin], params[:destination])
    if data[:info][:statuscode] == 402
      render json: RoadtripSerializer.errors(origin,destination)
    elsif user && roadtrip_params[:api_key].present?
      latlon = data[:route][:locations][1][:latLng]
      weather = ForecastFacade.get_forecast(latlon[:lat], latlon[:lng])
      roadtrip = Roadtrip.new(origin,destination,data,weather)
      render json: RoadtripSerializer.roadtrip_data(data,weather,roadtrip)
    else
      render status: 401
    end
  end

  private

  def roadtrip_params
    params.permit(:origin, :destination, :api_key)
  end
end
