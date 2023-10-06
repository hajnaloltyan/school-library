require_relative 'app'

def print_menu
  p 'Please choose an option by entering a number:'
  p '1 - List all books'
  p '2 - List all people'
  p '3 - Create a person'
  p '4 - Create a book'
  p '5 - Create a rental'
  p '6 - List all rentals for a given person id'
  p '7 - Exit'
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
    app.list_rentals_for_person
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
      p 'Invalid choice. Please enter a number between 1 and 7.'
    end
  end
end

main
