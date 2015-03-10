json.array!(@events) do |event|
  json.extract! event, :id, :name, :starttime, :endtime, :location, :type, :signup_required, :signup_start, :signup_end, :signup_cancellable_until
  json.url event_url(event, format: :json)
end
