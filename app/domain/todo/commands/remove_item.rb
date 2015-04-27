module Todo
  module Commands
    class RemoveItem < Command
      attribute :todo_list_id, String
      attribute :item_id,      String

      validates :todo_list_id, presence: true
      validates :item_id,      presence: true

      def aggregate_id
        todo_list_id
      end
    end
  end
end
