class BackgroundFacade

  def self.get_image(location)
    json = BackgroundService.get_image(location)
  end
end
