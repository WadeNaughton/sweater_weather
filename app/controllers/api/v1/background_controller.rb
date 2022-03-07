class Api::V1::BackgroundController < ApplicationController
  before_action :check_location
  def index
    background = BackgroundFacade.get_image(@location)
    render json: BackgroundSerializer.background_data(background,@location)
  end

  private

  def check_location
    if params[:location].present?
      @location = params[:location]
    else
      render status: 404
    end
  end
end
