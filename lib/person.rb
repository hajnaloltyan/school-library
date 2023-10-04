require_relative 'nameable'

class Person < Nameable
  attr_accessor :id, :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @id = rand(1..1000)
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age && @age >= 18
  end
end
