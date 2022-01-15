require './student'
require './teacher'
require './book'
require './rental'

def welcome
  puts 'Welcome to the School library App!'
  puts ' '
end

@teacher_arr = []
@student_arr = []
@book_arr = []
@rental_arr = []

def create_student
  print 'Age: '
  age = gets.chomp
  print 'Classroom: '
  classroom = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission [Y/F]? '
  permission = gets.chomp
  case permission
  when 'Y'
    permission = true
  when 'F'
    permission = false
  end
  student = Student.new(age, classroom, name, parent_permission: permission)
  @student_arr.push(student)
  puts 'Person created succesfully'
  puts ' '
  main
end

def create_teacher
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Specialization: '
  specialty = gets.chomp
  teacher = Teacher.new(specialty, age, name)
  @teacher_arr.push(teacher)
  puts 'Person created succesfully'
  puts ' '
  main
end

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  book = Book.new(title, author)
  @book_arr.push(book)
  puts 'Book created successfully'
  puts ' '
  main
end

def display_person
  puts ' '
  @student_arr.each { |x| puts "[Student] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}" }
  @teacher_arr.each { |x| puts "[Teacher] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}" }
  puts ' '
  main
end

def list_books
  @book_arr.each { |x| puts "Title: '#{x.title}', Author: #{x.author}" }
  puts ' '
  main
end

def select_books
  puts 'Select a book from the following list by number'
  @book_arr.each { |x| puts "#{@book_arr.find_index(x)}) Title: #{x.title}, Author: #{x.author}" }
end

def select_person
  puts 'Select a person from the following list by number (not id)'
  @student_arr.each do |x|
    puts "#{@student_arr.find_index(x)}) [Student] Name: #{x.name} ID: #{x.id} Age: #{x.age}"
  end
  @teacher_arr.each do |x|
    puts "#{@teacher_arr.find_index(x) + @student_arr.length}) [Teacher] Name: #{x.name} ID: #{x.id} Age: #{x.age}"
  end
end

def create_rental
  select_books
  number = gets.chomp
  book = @book_arr[number.to_i]
  puts ' '

  select_person

  value = gets.chomp

  person = if value.to_i < @student_arr.length
             @student_arr[value.to_i]
           else
             @teacher_arr[value.to_i - @student_arr.length]
           end

  puts ' '
  print 'Date: '
  date = gets.chomp
  rental = Rental.new(date, book, person)
  @rental_arr.push(rental)
  puts 'Rental created successfully'
  puts ' '
  main
end

def list_rentals
  print 'ID of person: '
  number = gets.chomp
  id_no = number.to_i
  puts 'Rentals:'
  @rental_arr.each do |x|
    puts "Date: #{x.date}, Book '#{x.book.title}' by #{x.book.author}" if x.person.id == id_no
  end
  puts ' '
  main
end

def options
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [input a number]: '
  number = gets.chomp
  case number
  when '1'
    create_student
  when '2'
    create_teacher
  end
end

def exit_msg
  puts ' '
  puts 'Thank you for using this App'
  nil
end

def sub_app(number)
  case number
  when '1'
    list_books

  when '2'
    display_person

  when '3'
    create_person

  when '4'
    create_book
  end
end

def sub_app2(number)
  case number
  when '5'
    create_rental

  when '6'
    list_rentals

  when '7'
    exit_msg
  end
end

def app(number)
  sub_app(number)
  sub_app2(number)
end

def main
  options
  number = gets.chomp
  app(number)
end

welcome
main
