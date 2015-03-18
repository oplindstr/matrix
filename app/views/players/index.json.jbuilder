json.array!(@players) do |player|
  json.extract! player, :id, :name, :expectation, :deviation
  json.url player_url(player, format: :json)
end
