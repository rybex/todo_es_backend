module Todo
  module Commands
    class CreateTodoList < Command
      attribute :title, String

      validates :title,  presence: true

      def aggregate_id
        SecureRandom.uuid
      end
    end
  end
end
