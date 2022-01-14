require './student'
require './teacher'
require './book'
require './rental'

def welcome
    puts "Welcome to the School library App!"
    puts " "
end

$teacher_arr = []
$student_arr = []
$book_arr = []
$rental_arr = []

def create_student
    print "Age: "
    age = gets.chomp
    print "Classroom: "
    classroom = gets.chomp
    print "Name: "
    name = gets.chomp
    print "Has parent permission [Y/F]? "
    permission = gets.chomp
    if permission == "Y" 
        permission = true
    elsif permission == "F"
        permission = false
    end
    student = Student.new(age, classroom, name, permission)
    $student_arr.push(student)
    puts "Person created succesfully"
    puts " "
    main()
end

def create_teacher
    print "Age: "
    age = gets.chomp
    print "Name: "
    name = gets.chomp
    print "Specialization: "
    specialty = gets.chomp
    teacher = Teacher.new(specialty, age, name)
    $teacher_arr.push(teacher)
    puts "Person created succesfully"
    puts " "
    main()
end



def main
    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
    number = gets.chomp

    if number == "1"
        list_books()

    elsif number == "2"
        puts " "
        display_person()
    
    elsif number == "3"
        print "Do you want to create a student (1) or a teacher (2)? [input a number]: "
        number = gets.chomp
        if number == "1"
            create_student()
        elsif number == "2"
            create_teacher()
        end
        
    elsif number == "4"
        create_book()

    elsif number == "5"
        create_rental()

    elsif number == "6"
        list_rentals()

    elsif number == "7"
        puts " "
        puts "Thank you for using this App"
        return
    end

end

welcome()
main()