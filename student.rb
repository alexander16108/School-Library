require "./person.rb"

class Student < Person
    def initialize 
        super()
        @classroom
    end

    def play_hockey
        "¯\(ツ)/¯"
    end
end
