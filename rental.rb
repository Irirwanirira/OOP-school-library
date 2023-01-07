require_relative 'person'
# require_relative 'book'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, person, book)
    @date = date

    @person = person
    # person.rentals << self
    # person.add_rentals(self)

    @book = book
    # book.rentals << self
    # person.add_rentals(self)
  end
end
