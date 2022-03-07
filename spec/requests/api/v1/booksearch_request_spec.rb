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
      expect(booksearch[:data][:attributes]).to have_key(:destination)
      expect(booksearch[:data][:attributes]).to have_key(:total_books_found)

      expect(booksearch[:data][:attributes]).to have_key(:forecast)
      expect(booksearch[:data][:attributes][:forecast]).to have_key(:summary)
      expect(booksearch[:data][:attributes][:forecast]).to have_key(:temperature)

      expect(booksearch[:data][:attributes][:books][0]).to have_key(:isbn)
      expect(booksearch[:data][:attributes][:books][0]).to have_key(:publisher)
      expect(booksearch[:data][:attributes][:books][0]).to have_key(:title)

      expect(booksearch[:data][:attributes][:books][0]).to_not have_key(:has_fulltext)
      expect(booksearch[:data][:attributes][:books][0]).to_not have_key(:edition_count)
      expect(booksearch[:data][:attributes][:books][0]).to_not have_key(:ebook_count)
      expect(booksearch[:data][:attributes][:books][0]).to_not have_key(:key)
      expect(booksearch[:data][:attributes][:books][0]).to_not have_key(:title_suggest)
      expect(booksearch[:data][:attributes][:books][0]).to_not have_key(:edition_key)
  end
  it 'returns error for missing location' do
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get '/api/v1/book-search', headers: headers, params: { quantity: 5 }

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
  end

  it 'returns error for missing quantity' do
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get '/api/v1/book-search', headers: headers, params: { location: 'denver,co'}

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
  end
end
