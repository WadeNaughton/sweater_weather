require 'rails_helper'

RSpec.describe MapService do
  it "returns map data" do
    search = MapService.get_coordinates("Brunswick,Md")
    expect(search).to be_a Hash
  end
end
