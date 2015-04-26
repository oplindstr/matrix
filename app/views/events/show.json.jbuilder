json.array!(@events) do |event|
  json.extract! event, :id, :name, :starttime, :endtime, :location, :event_type, :signup_required, :signup_start, :signup_end, :signup_cancellable_until, :price, :descr
  json.url event_url(event, format: :json)
end
