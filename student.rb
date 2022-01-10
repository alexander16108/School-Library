require './person'

class Student < Person
  def initialize(age, classroom, name = 'unkown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hockey
    "¯\(ツ)/¯"
  end
end
