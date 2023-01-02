class Person
  def initialize(name = "unknown", perent_permission = true, age)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @perent_permission = perent_permission
  end

  if age >= 18 
    true
  else false

  if age>=18 || parent_permission == true 
    puts "can use service"
  else "can not use service"

end

class Student < Person
  def play_hooky(classroom)
    @classroom = classroom
    return "¯\(ツ)/¯"
  end
end

person_1 = Person.new("Rhys",32)
puts person_1.name
