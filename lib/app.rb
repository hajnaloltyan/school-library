class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      p "Title: #{book.title}, Author: #{book.author}"
  end
end
