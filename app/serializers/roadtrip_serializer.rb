class RoadtripSerializer

  def self.roadtrip_data(data,weather,roadtrip)
          {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": roadtrip.start_city,
          "end_city": roadtrip.end_city,
          "travel_time": roadtrip.travel_time,
          "weather_at_eta": {
            "temperature": roadtrip.temp(data,weather),
            "conditions": roadtrip.condition(data,weather)
          }
        }
      }
    }

  end

  def self.errors(roadtrip)
        {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": roadtrip.start_city,
          "end_city": roadtrip.end_city,
          "travel_time": "impossible",
          "weather_at_eta": {
            "temperature": "",
            "conditions": ""
          }
        }
      }
    }
  end
end
