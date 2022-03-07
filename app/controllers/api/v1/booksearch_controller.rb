class Api::V1::BooksearchController < ApplicationController
  before_action :check_location
  def index
    forecast = ForecastFacade.get_forecast(@coordinates[:lat], @coordinates[:lng])
    book = BooksearchFacade.get_book(params[:location], params[:quantity])
    render json: BooksSerializer.book_data(book,forecast)
  end
end

def check_location
  if params[:location].present?
    @coordinates = MapFacade.get_coordinates(params[:location])

  else
    render status: 404
  end
end
