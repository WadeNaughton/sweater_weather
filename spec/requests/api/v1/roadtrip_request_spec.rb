require 'rails_helper'
RSpec.describe 'roadtrip request' do
  it "returns json" do
    user = User.create!(email: 'test@test.com', password: 'asdf', password_confirmation: 'asdf')
      body = {
          "origin": "Denver,CO",
          "destination": "Pueblo,CO",
          "api_key": "#{user.auth_token}"
      }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

      road_trip = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(road_trip).to have_key(:data)
      expect(road_trip[:data]).to have_key(:type)
      expect(road_trip[:data]).to have_key(:attributes)
      expect(road_trip[:data][:attributes]).to have_key(:start_city)
      expect(road_trip[:data][:attributes]).to have_key(:end_city)
      expect(road_trip[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
  end

  it "text" do
    user = User.create!(email: 'test@test.com', password: 'asdf', password_confirmation: 'asdf')
      body = {
          "origin": "Denver,CO",
          "destination": "London,UK",
          "api_key": "#{user.auth_token}"
      }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

      road_trip = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
  end

  it "returns 401 with bad api" do
    user = User.create!(email: 'test@test.com', password: 'asdf', password_confirmation: 'asdf')
      body = {
          "origin": "Denver,CO",
          "destination": "Pueblo,CO"

      }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)
      expect(response.status).to eq(401)
  end
end
