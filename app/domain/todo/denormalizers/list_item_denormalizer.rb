module Todo
  module Denormalizers
    class ListItemDenormalizer
      def handle_event(event)
        if event.event_type == Events::ItemAddedToList.name
          add_item_to_list(event.data)
        elsif event.event_type == Events::ItemRemoved.name
          remove_item(event.data)
        end
      end

      private

      def add_item_to_list(data)
        ReadModels::ListItemEntity.create(data)
      end

      def remove_item(data)
        ReadModels::ListItemEntity.where(uid: data[:item_id]).destroy_all
      end
    end
  end
end
