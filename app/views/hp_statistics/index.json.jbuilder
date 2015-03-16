json.array!(@hp_statistics) do |hp_statistic|
  json.extract! hp_statistic, :id, :u_id, :expectation, :deviation, :assurity
  json.url hp_statistic_url(hp_statistic, format: :json)
end
