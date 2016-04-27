json.array!(@post_tags) do |post_tag|
  json.extract! post_tag, :id, :post_id, :tag
  json.url post_tag_url(post_tag, format: :json)
end
