require_relative 'app'

def print_menu
  puts
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  puts 'Enter your choice:'
end

def handle_choice(choice, app)
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
    return false
  end
  true
end

def main
  app = App.new
  loop do
    print_menu
    choice = gets.chomp.to_i
    if choice.between?(1, 7)
      break unless handle_choice(choice, app)
    else
      puts 'Invalid choice. Please enter a number between 1 and 7.'
    end
  end
end

main
