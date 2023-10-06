require_relative 'app'

def main
  loop do
    p 'Please choose an option by entering a number:'
    p '1 - List all books'
    p '2 - List all people'
    p '3 - Create a person'
    p '4 - Create a book'
    p '5 - Create a rental'
    p '6 - List all rentals for a given person id'
    p '7 - Exit'

    choice = gets.chomp.to_i

    app = App.new

    case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals
    when 7
      break
    else
      p 'Invalid choice. Please try again.'
    end
  end
end

main
