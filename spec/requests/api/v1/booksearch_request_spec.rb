require 'rails_helper'
RSpec.describe 'booksearch request' do
  it 'returns json' do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      get '/api/v1/book-search', headers: headers, params: { location: "denver,co", quantity: 5 }
      booksearch = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(booksearch).to be_a Hash
      expect(booksearch[:data]).to have_key(:attributes)
      expect(booksearch[:data][:attributes]).to have_key(:books)
      expect(booksearch[:data][:attributes][:books]).to have_key(:isbn)
  end
end
