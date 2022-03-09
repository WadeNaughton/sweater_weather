require 'rails_helper'
RSpec.describe 'users request' do
  it 'returns json', :vcr do
    data = {
      "email": "wade@gmail.com",
      "password": "password",
      "password_confirmation": "password"
    }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(data)
    user = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it "returns error when password confirmation and password do not match", :vcr do
    data = {
      "email": "wade@gmail.com",
      "password": "password",
      "password_confirmation": "pass"
    }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(data)
    expect(response).to_not be_successful
    expect(response.status).to eq(404)
  end
end
