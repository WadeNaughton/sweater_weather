require 'rails_helper'

RSpec.describe RoadtripService do
  it "returns road trip data", :vcr do
    search = RoadtripService.get_route("denver,co", "pueblo,co")
    expect(search).to be_a Hash
  end
end
