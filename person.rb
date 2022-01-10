class Person
    def initialize(name, age, parent_permission)
        @name = "unknown"
        @age = age
        @parent_permission = true
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

    def can_use_services?
        if is_of_age?
            true
        elsif @parent_permission
            true
        else 
            false
        end
    end
        
end
