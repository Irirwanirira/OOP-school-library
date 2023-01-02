class Student < Person
  def initialize(name = "unknown", age, classroom, parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    ' ¯\(ツ)/¯ '
  end
end
