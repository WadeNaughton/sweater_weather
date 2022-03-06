class MapService

    def self.connection
      Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1/address?") do |faraday|
        faraday.params['key'] = ENV['MAP_API_KEY']
      end
    end

    def self.get_coordinates(location)
      response = connection.get do |faraday|
        faraday.params['location'] = location
      end
      JSON.parse(response.body, symbolize_names: true)
    end


end
