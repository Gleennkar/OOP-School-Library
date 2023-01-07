require_relative '.trimmer_decorator'
require_relative '.person'
require_relative '.capitalize_decorator'

person = Person.new(10, 'Joy')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name
