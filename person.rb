require_relative 'nameable'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, parent_permission, name = 'unknown')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rentals(book, date)
    Rental.new(date, self, book)
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    true if of_age? || @parent_permission
  end
end
