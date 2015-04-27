module Todo
  module Services
    class RemoveItem
      include Service

      def call(command)
        build(command.aggregate_id, List).remove_item(command.item_id)
      end
    end
  end
end
