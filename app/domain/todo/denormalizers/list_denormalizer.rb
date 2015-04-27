module Todo
  module Denormalizers
    class ListDenormalizer
      def handle_event(event)
        if event.event_type == Events::TodoListCreated.name
          create_list(event.data)
        elsif event.event_type == Events::TodoListRemoved.name
          remove_list(event.data)
        end
      end

      private

      def create_list(data)
        ReadModels::ListEntity.create(data)
      end

      def remove_list(data)
        ReadModels::ListEntity.where(uid: data[:list_id]).destroy_all
      end
    end
  end
end