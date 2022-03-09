require 'rails_helper'

RSpec.describe BackgroundFacade do
  it '.search_for_background', :vcr do
    searched_background= BackgroundFacade.get_image('denver,co')
    expect(searched_background).to be_a Hash
    background = searched_background[:photos].first
    expect(background).to have_key(:id)
    expect(background).to have_key(:url)
    expect(background).to have_key(:photographer_url)
    expect(background).to have_key(:photographer)
  end
end
