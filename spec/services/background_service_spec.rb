require 'rails_helper'

RSpec.describe BackgroundService do
  it "returns image data", :vcr do

    search = BackgroundService.get_image('denver')
    expect(search).to be_a Hash
  end
end
