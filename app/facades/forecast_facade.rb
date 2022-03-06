class ForecastFacade

  def self.get_forecast(lat,lon)
    test = ForecastService.get_forecast(lat,lon)
  end
end
