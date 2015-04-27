module Todo
  module Services
    class AddItemToList
      include Service

      def call(command)
        build(command.aggregate_id, List).add_item(command.title, command.type)
      end

    end
  end
end