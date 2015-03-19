json.array!(@hands) do |hand|
  json.extract! hand, :id, :match_id, :points1, :points2, :declarer, :bid, :contract, :made
  json.url hand_url(hand, format: :json)
end
