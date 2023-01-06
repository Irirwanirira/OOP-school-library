require_relative 'rental'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'person'
require_relative 'book'
require_relative 'student'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    @welcome_text = "\nPlease choose an option by entering a number:
    1- List all books
    2- List all people
    3- Create a person
    4- Create a book
    5- Create a rental
    6- List all rentals for a given person id
    7- Exit"
  end

  def add_person(person)
    @people.push(person)
  end

  def add_book(book)
    @books.push(book)
  end

  def add_rentals(rental)
    @rentals.push(rental)
  end

  def list_books
    if @books.empty?
      puts 'Book list is empty!'
    else
      @books.each_with_index do |book, index|
        puts "#{index})- Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'People list is empty! '
    else
      @people.each_with_index do |person, index|
        puts "#{index})- [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def list_rentals
    puts 'No rentals available!' if @rentals.empty?
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      if rental.person_id == person_id
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author} taken by #{rental.person.name}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    if person_type != '1' && person_type != '2'
      puts 'Invalid option'
      return
    end
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    if person_type == '1'
      print 'Parent Permission: '
    else
      print 'Specialization:'
    end
    parent_permission = gets.chomp
    person = person_type == '1' ? Student.new(name, age, parent_permission) : Teacher.new(age, 'Unknown', name)
    @people.push(person)
    puts "Person created successfully #{person}", person.name, person.age,
         person
  end

  def create_student(name, age)
    print 'Has parent permission?[Y/N]: '
    parent_permission = if gets.chomp =~ /(n|N)/
                          false
                        else
                          true
                        end
    Student.new(name, age, parent_permission: parent_permission)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    add_book(book)
    puts 'Book created successfully.'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    list_books
    book_id = gets.chomp.to_i
    puts 'Select a person from the following list by number: '
    list_people
    person_id = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @people[person_id], @books[book_id]))
    add_rentals(rentals)
    puts 'Rental created successfully.'
  end

  def run
    puts 'Welcome to School Library App!'
    exit = false
    until exit
      puts @welcome_text
      number = gets.to_i

      if number < 7
        choose_action(number)
      elsif number == 7
        puts 'Thank you for using our library app!'
        exit = true
      else
        puts 'wrong input'
      end
    end
  end
end
