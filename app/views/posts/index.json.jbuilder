json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :title, :text
  json.url post_url(post, format: :json)
end
