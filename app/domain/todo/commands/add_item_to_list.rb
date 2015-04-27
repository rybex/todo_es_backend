module Todo
  module Commands
    class AddItemToList < Command
      attribute :todo_list_id,  String
      attribute :title,         String
      attribute :type,          String

      validates :todo_list_id,  presence: true
      validates :title,         presence: true
      validates :type,          presence: true

      def aggregate_id
        todo_list_id
      end
    end
  end
end
