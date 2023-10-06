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

  def create_person
    p 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    role = gets.chomp.to_i
    p 'Age:'
    age = gets.chomp.to_i
    p 'Name:'
    name = gets.chomp

    if role == 1
      p 'Has parent permission? [Y/N]:'
      parent_permission = gets.chomp.downcase == 'y'
      person = Student.new(age, name, parent_permission)
    else
      p 'Specialization:'
      specialization = gets.chomp
      person = Teacher.new(age, name, specialization)
    end
    @people << person
    p 'Person created successfully!'
  end

  def create_rental
    p 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      p "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    book = @books[book_index]

    p 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      p "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    person = @people[person_index]

    p 'Date:'
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental
    p 'Rental created successfully!'
  end
end
