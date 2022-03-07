class BooksSerializer


  def self.book_data(book,forecast)
    {
      "data": {
        "id": "null",
        "type": "books",
        "attributes": {
          "destination": book[:q],
          "forecast": {
            "summary": forecast[:current][:weather][0][:description],
            "temperature": forecast[:current][:temp]
          },
          "total_books_found": book[:numFound],
          "books": book[:docs].map do |b|
            {
              "isbn": b[:isbn],
              "title": b[:title],
              "publisher": b[:publisher]
            }
          end
        }
      }
    }
  end
end
