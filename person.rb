require './corrector'
require './rentals'

class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
    @corrector = Corrector.new
    @rental = []
  end
  attr_accessor :id, :name, :age
  attr_reader :rental
  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    if of_age? == true || @parent_permission
      true
    else
      false
    end
  end

  def validate_name(name)
    @corrector.correct_name(name)
  end

  def add_rental(rental)
    @rental.push(rental)
    rental.person = self
end
end
