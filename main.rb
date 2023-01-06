require_relative 'app'

def main
  app = App.new
  app.run
end

def choose_action(number)
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
