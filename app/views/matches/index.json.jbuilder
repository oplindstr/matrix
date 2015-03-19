json.array!(@matches) do |match|
  json.extract! match, :id, :player1, :player2, :player3, :player4, :winners
  json.url match_url(match, format: :json)
end
