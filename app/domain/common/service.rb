module Service
  include Todo::StoreInjector

  def build(aggregate_id, aggregate_class)
    binding.pry
    aggregate = aggregate_class.new(aggregate_id)
    events = load_events(aggregate.id)
    aggregate.apply(events)
    aggregate
  end

  def load_events(aggregate_id)
    event_store.read_all_events(stream_name(aggregate_id))
  end

  def stream_name(aggregate_id)
    "stream_#{aggregate_id}"
  end
end