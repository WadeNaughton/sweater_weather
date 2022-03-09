require 'rails_helper'
RSpec.describe 'sessions request' do
  it 'returns json', :vcr do
  data = {
    "email": "wade@gmail.com",
    "password": "password",
    "password_confirmation": "password"
  }
  headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
  post '/api/v1/users', headers: headers, params: JSON.generate(data)
  JSON.parse(response.body, symbolize_names: true)

  session = {
    "email": "wade@gmail.com",
    "password": "password"
  }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/sessions', headers: headers, params: JSON.generate(session)
    user = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it "returns error when email is wrong", :vcr do
    data = {
      "email": "wade@gmail.com",
      "password": "password",
      "password_confirmation": "password"
    }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(data)
    JSON.parse(response.body, symbolize_names: true)

    session = {
      "email": "w@gmail.com",
      "password": "password"
    }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      post '/api/v1/sessions', headers: headers, params: JSON.generate(session)
      user = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
  end

  it "returns error when password is wrong", :vcr do
    data = {
      "email": "wade@gmail.com",
      "password": "password",
      "password_confirmation": "password"
    }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(data)
    JSON.parse(response.body, symbolize_names: true)

    session = {
      "email": "wade@gmail.com",
      "password": "pas"
    }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      post '/api/v1/sessions', headers: headers, params: JSON.generate(session)
      user = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
  end
end
