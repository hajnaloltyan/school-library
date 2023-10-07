require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

class App
  attr_accessor :books, :people, :rental, :classroom

  def initialize
    @books = []
    @people = []
    @rentals = []
    puts 'Welcome to School Library App!'
  end

  def list_books
    puts
    if @books.empty?
      puts 'No books found.'
    else
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    puts
    if @people.empty?
      puts 'No people found.'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def list_rentals
    puts
    puts 'ID of person:'
    person_id = gets.chomp.to_i
    found_person = @people.find { |person| person.id == person_id }
    if found_person.nil?
      puts 'Person not found.'
    else
      rentals = @rentals.select { |rental| rental.person == person }
      if rentals.empty?
        puts 'No rentals found.'
      else
        puts 'Rentals:'
        rentals.each do |rental|
          rented_book = @books.find { |book| book.id == rental.book_id }
          puts "Date: #{rental.date} Book #{rented_book.title} by #{rented_book.author}"
        end
      end
    end
  end

  def create_book
    puts
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts
    puts 'Book created successfully!'
  end

  def create_person
    puts
    puts 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:'
    role = gets.chomp.to_i
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp

    if role == 1
      puts 'Has parent permission? [y/n]:'
      permission = (gets.chomp == 'y')
      classroom = Classroom.new('green')
      person = Student.new(age, classroom, name, parent_permission: permission)
    else
      puts 'Specialization:'
      specialization = gets.chomp
      person = Teacher.new(age, name, specialization)
    end
    @people << person
    puts
    puts 'Person created successfully!'
  end

  def create_rental
    puts
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    book = @books[book_index]

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    person = @people[person_index]

    puts 'Date:'
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts
    puts 'Rental created successfully!'
  end
end
