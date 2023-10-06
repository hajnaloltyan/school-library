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

  def list_people
    @people.each do |person|
      p "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_rentals
    p 'ID of person:'
    person_id = gets.chomp.to_i
    rentals = @rentals.select { |rental| rental.person_id == person_id }
    if rentals.empty?
      p "No rentals found for person with ID #{person_id}."
    else
      rentals.each do |rental|
        rented_book = @books.find { |book| book.id == rental.book_id }
        p 'Rentals:'
        p "Date: #{rental.date} Book #{rented_book.title} by #{rented_book.author}"
      end
    end
  end

  def create_book
    p 'Title:'
    title = gets.chomp
    p 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    p 'Book created successfully!'
  end
end
