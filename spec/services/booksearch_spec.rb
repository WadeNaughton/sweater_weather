require 'rails_helper'

RSpec.describe BooksearchService do
  it "returns book data" do

    search = BooksearchService.get_book('denver,co', 5)
    expect(search).to be_a Hash

  end
end
