require 'rails_helper'

RSpec.describe MapService do
  it "returns map data", :vcr do
    search = MapService.get_coordinates("denver,co")
    expect(search).to be_a Hash
  end
end
