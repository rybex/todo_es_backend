module AggregateRoot

  def publish(event)
    event_store.publish_event(event, stream_name)
  end

  def stream_name
    "stream_#{id}"
  end
end