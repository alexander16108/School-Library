require "./person.rb"

class Student < Person
  def initialize(classroom)
    super(name = "unknown", parent_permission = true, age)
    @classroom = classroom
  end

  def play_hockey
    "¯\(ツ)/¯"
  end
end
