module Todo
  module Commands
    class RemoveTodoList < Command
      attribute :todo_list_id, String

      validates :todo_list_id, presence: true
    end
  end
end
