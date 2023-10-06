class Person
  attr_accessor :id, :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @id = rand(1..1000)
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
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
