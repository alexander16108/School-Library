class Person
  def initialize(name = "unknown", parent_permission = true, age)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end
  attr_accessor :id
  attr_accessor :name
  attr_accessor :age

  private

  def is_of_age?
    if @age >= 18
      true
    else
      false
    end
  end

  public

  def can_use_services?
    if is_of_age? == true || @parent_permission
      true
    else
      false
    end
  end

  def work
    true
  end
end
