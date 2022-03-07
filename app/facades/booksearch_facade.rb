class BooksearchFacade

  def self.get_book(location,quantity)
    json = BooksearchService.get_book(location,quantity)
  end

end
