json.array!(@signups) do |signup|
  json.extract! signup, :id, :user_id, :event_id
  json.url signup_url(signup, format: :json)
end
