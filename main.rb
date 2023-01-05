require_relative 'app'

puts 'Welcome to your school library'

def main
  app = App.new
  app.start
end

def pick_action_command(number)
  case number
  when 1
    list_books
  when 2
    list_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_rentals
  end
end

main
