class Errors
  IncorrectAttributes = Class.new(StandardError)
  AlreadyCreated      = Class.new(StandardError)
  AlreadyRemoved      = Class.new(StandardError)
  ItemNotExist        = Class.new(StandardError)
end