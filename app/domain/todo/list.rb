module Todo
  class List
    include StoreInjector
    include AggregateRoot

    def initialize(id)
      @id = id
      @state = :virtual
      @items = []
    end
    attr_reader :id, :items, :state

    def apply(events)
      events.each do |event|
        if event.event_type == 'Todo::Events::ItemAddedToList'
          apply_item_added_to_list(event)
        elsif event.event_type == 'Todo::Events::ItemRemoved'
          apply_item_removed_from_list(event)
        elsif event.event_type == 'Todo::Events::TodoListCreated'
          apply_list_created
        elsif event.event_type == 'Todo::Events::TodoListRemoved'
          apply_list_removed
        end
      end
    end

    def add_item(item_title, item_type)
      data = { list_uid: id, uid: SecureRandom.uuid, title: item_title, item_type: item_type }
      publish(Events::ItemAddedToList.new({data: data}))
    end

    def remove_item(item_id)
      binding.pry
      raise ItemNotExist unless item_exist?(item_id)
      data = { list_id: id, item_id: item_id }
      publish(Events::ItemRemoved.new({data: data}))
    end

    def create(list_title)
      raise AlreadyCreated if state == :created
      data = { uid: id, title: list_title }
      publish(Events::TodoListCreated.new({data: data}))
    end

    def remove
      raise AlreadyRemoved if state == :removed
      data = { list_id: id }
      publish(Events::TodoListRemoved.new({data: data}))
    end

    private

    def apply_item_added_to_list(event)
      binding.pry
      item = ListItem.new(event.data)
      items << item
    end

    def apply_item_removed_from_list(event)
      items.reject { |item| item.item_id == event.data.item_id }
    end

    def apply_list_created
      state = :created
    end

    def apply_list_removed
      state = :removed
    end

    def item_exist?(item_id)
      items.any? { |item| item.item_id == item_id }
    end
  end
end