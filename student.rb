require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'unkown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hockey
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    classroom.student.push(self) unless classroom.students.include?(self)
  end
end
