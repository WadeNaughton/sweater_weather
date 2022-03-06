class MapFacade

  def self.get_coordinates(location)
    test = MapService.get_coordinates(location)
    test[:results][0][:locations][0][:latLng]
  end
end
