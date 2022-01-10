require "./person.rb"

class Teacher < Person
  def initialize(specialization)
    super(name = "unknown", parent_permission = true, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
