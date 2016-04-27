json.array!(@news) do |news|
  json.extract! news, :id, :text, :header, :priority
  json.url news_url(news, format: :json)
end
