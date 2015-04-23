module Todo
  module Commands
    class CreateTodoList < Command
      attribute :title, String

      validates :type,  presence: true
    end
  end
end
