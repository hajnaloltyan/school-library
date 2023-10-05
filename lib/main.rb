require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new(22, 'maximiliano')

capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized name: #{capitalized_person.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and trimmed name: #{capitalized_trimmed_person.correct_name}"
