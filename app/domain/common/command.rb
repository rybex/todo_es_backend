class Command
  include Virtus.model
  include ActiveModel::Validations

  def validate!
    raise Errors::IncorrectAttributes, errors unless valid?
  end

  def persisted?
    false
  end
end