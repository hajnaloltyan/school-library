require_relative 'person'

class Student < Person
  def initialize(name, age, parent_permission: true)
    super(name, age, parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
