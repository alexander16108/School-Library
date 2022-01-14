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

def create_book
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    book = Book.new(title, author)
    $book_arr.push(book)
    puts "Book created successfully"
    puts " "
    main()
end

def display_person
    if $teacher_arr != [] && $student_arr != []
        $student_arr.each {|x| puts "[Student] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}"}
        $teacher_arr.each {|x| puts "[Teacher] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}"}
    elsif $teacher_arr != [] && $student_arr == []
        $teacher_arr.each {|x| puts "[Teacher] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}"}
    elsif $teacher_arr == [] && $student_arr != []
        $student_arr.each {|x| puts "[Student] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}"}
    else 
        puts "There is currently no Teacher nor student"
    end
    puts " "
    main()
end

def list_books
    if $book_arr != []
        $book_arr.each {|x| puts "Title: '#{x.title}', Author: #{x.author}"}
        puts " "
        main()
    else
        puts "There are currently no registered books"
        puts " "
        main()
    end
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