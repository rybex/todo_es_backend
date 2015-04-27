module Todo
  module StoreInjector
    attr_writer :event_store

    def event_store
      @event_store ||= setup
    end

    private

    def setup
      client = RailsEventStore::Client.new
      client.subscribe(Denormalizers::ListDenormalizer.new, [Events::TodoListCreated.name, Events::TodoListRemoved.name])
      client.subscribe(Denormalizers::ListItemDenormalizer.new, [Events::ItemAddedToList.name, Events::ItemRemoved.name])
      client
    end
  end
end