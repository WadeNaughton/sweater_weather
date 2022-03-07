class BooksearchService

    def self.connection
      url = "http://openlibrary.org/search.json?"
      Faraday.new(url: url)
  end

  def self.get_book(location, quantity)
    response = connection.get do |faraday|
      faraday.params['place'] = location
      faraday.params['limit'] = quantity
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
