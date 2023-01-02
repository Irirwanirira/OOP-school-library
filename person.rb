class Person
  atrr_reader :id, :name, :age
  atrr_writer :name, :age

  def initialize(age, name = 'unknown', perent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @perent_permission = perent_permission
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end
end