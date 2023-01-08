require_relative 'person'
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name: 'Unknown')
    super(age, name: name, parent_permission: true)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
