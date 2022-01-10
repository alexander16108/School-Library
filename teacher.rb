require "./person.rb"

class Teacher < Person
    def initialize
        super()
        @specialization
    end

    def can_use_services?
        true
    end
end