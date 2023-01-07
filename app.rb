require_relative 'teacher'
require_relative 'student'
require_relative 'books'
require_relative 'rentals'

class App
  private

  def create_student(arr_person)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permision? [Y/N]: '
    get_permision = gets.chomp.upcase
    until %w[Y N].include?(get_permision)
      puts 'Please Enter valid permision'
      get_permision = gets.chomp.upcase
    end
    case get_permision
    when 'Y'
      permision = true
    when 'N'
      permision = false
    end
    new_student = Student.new(age, name, permision)
    arr_person.push(Student.new(age, name, permision)) unless arr_person.include?(Student.new(age, name, permision))
    print "\n Student with Name: ", new_student.name, ' Permision: ', new_student.can_use_services, ' Age: ',
          new_student.age, " created successfully\n\n"
  end

  def create_teacher(arr_person)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp.downcase
    new_teacher = Teacher.new(age, specialization, name)
    unless arr_person.include?(Teacher.new(age, specialization,
                                           name))
      arr_person.push(Teacher.new(age, specialization,
                                  name))
    end
    print "\n Teacher with Name: ", new_teacher.name, ' Specialization: ', new_teacher.specialization, ' Age: ',
          new_teacher.age
    print " created successfully\n"
  end

  public

  def list_all_books(arr_books)
    if arr_books.empty?
      puts 'No Book to Diplay yet'
      print " \n"
    else
      arr_books.each do |book|
        print 'Book title: ', "\"#{book.title}\"", ' Author: ', book.author, "\n"
      end
    end
    print "\n"
  end

  def list_all_people(arr_person)
    if arr_person.empty?
      puts 'No person to display yet'
      print " \n"
    else
      arr_person.each do |person|
        print "[#{person.class}] Name: ", person.name, ', ID: ', person.id, ', Age: ', person.age, "\n"
      end
      print "\n"
    end
  end

  def create_book(arr_books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Books.new(title, author)
    arr_books.push(Books.new(title, author)) unless arr_books.include?(Books.new(title, author))
    print "\n Book with title: ", "\"#{new_book.title}\"", ' author: ', new_book.author
    print " created successfully \n\n"
  end

  def create_person(arr)
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    option = gets.chomp
    case option
    when '1'
      create_student(arr)
    when '2'
      create_teacher(arr)
    end
  end

  def create_rental(arr_person, arr_books, rentals)
    puts 'Select a book from the following list by number: '
    arr_books.each_with_index do |book, index|
      print "#{index})", ' Title: ', "\"#{book.title}\", ", 'Author: ', book.author, " \n"
    end
    print " \n"
    selected_book = gets.chomp.to_i
    puts 'Select a person from the following list by number(not id): '
    arr_person.each_with_index do |person, index|
      print "#{index})", "[#{person.class}] Name: ", person.name, ', ID: ', person.id, ', Age: ', person.age,
            "\n"
    end
    print " \n"
    selected_person = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    new_rental = Rentals.new(date, arr_person[selected_person], arr_books[selected_book])
    rentals.push(new_rental) unless rentals.include?(new_rental)
    print "\n Book with title: ", "\"#{arr_books[selected_book].title}\"", ' author: ',
          arr_books[selected_book].author
    print ' Was rented by ', "#{arr_person[selected_person].name}  successfully \n\n"
  end

  def list_all_rental(rentals)
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    rentals.each do |rental|
      if rental.person.id == id
        print 'Date: ', rental.date, ', Book ', "\"#{rental.book.title}\"", ', by ', rental.book.author
      else
        puts "ID: #{id} not found Please enter valid Id"
      end
      print " \n"
    end
    print " \n"
  end

  def run
    display = ["Welcome to school library App!\n\n", 'Please Choose an option by entering a number',

               '1 - List all books', '2 - List all people', '3 - Create a person', '4 - Create a book',
               '5 - Create rental', '6 - List all rentals for a given person id', '7 - Exit']

    display.each do |ui|
      puts ui
    end
  end
end
