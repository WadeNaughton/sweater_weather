require 'rails_helper'

RSpec.describe BooksearchFacade do
  it '.search_for_books' do
    searched_books = BooksearchFacade.get_book('Denver, CO', 5)
    expect(searched_books).to have_key(:numFound)
    expect(searched_books[:docs][0]).to have_key(:title)
    expect(searched_books[:docs][0]).to have_key(:publisher)
    expect(searched_books[:docs][0]).to have_key(:isbn)

    expect(searched_books[:docs][0]).to have_key(:isbn)

  end
end
