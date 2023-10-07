require_relative 'person'

class Student < Person
  attr_accessor :classroom, :parent_permission

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
