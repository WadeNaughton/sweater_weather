class RoadtripFacade

  def self.get_route(origin,destination)
    route = RoadtripService.get_route(origin,destination)
  end

end
