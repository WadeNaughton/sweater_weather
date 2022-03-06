require 'rails_helper'

RSpec.describe ForecastService do
  it "returns weather data", :vcr do
    lat = 39.738453
    lng = -104.984853
    search = ForecastService.get_forecast(lat,lng)
    expect(search).to be_a Hash
  end
end
