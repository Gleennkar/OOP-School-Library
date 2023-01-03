require_relative 'person'

class Teacher < person
  def initialize(_specilization, age, name = 'Unknown', parent_pemission: true)
    super age, name, parent_pemission
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
