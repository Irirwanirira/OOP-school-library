# require_relative 'person'

class Nameable
  def correct_name
    raise NotImplementedError, "not implemented"
  end
end

class BaseDecorator < Nameable
    atrr_accessor :nameable

    def initilize(nameable)
      super()
      @nameable = nameable
    end

    def correct_name
      @nameable.correct_name
    end
end

class CapitilizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitilize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    if @nameable.correct_name > 10
      @nameable.correct_name.delete(@nameable.correct_name[10..])
    else
      @nameable.correct_name
    end
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
capitalizedTrimmedPerson.correct_name
