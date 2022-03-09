class RoadtripService
  def self.connection
    Faraday.new(url: "http://www.mapquestapi.com/directions/v2/route?") do |faraday|
      faraday.params['key'] = ENV['MAP_API_KEY']
    end
  end

  def self.get_route(origin,destination)
    response = connection.get do |faraday|
      faraday.params['to'] = origin
      faraday.params['from'] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
