require 'rails_helper'

RSpec.describe RoadtripFacade do
  it '.search_for_route', :vcr do
    searched_route= RoadtripFacade.get_route('denver,co', 'pueblo,co')
  end
end
