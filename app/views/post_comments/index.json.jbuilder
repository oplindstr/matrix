json.array!(@post_comments) do |post_comment|
  json.extract! post_comment, :id, :post_id, :user_id, :comment
  json.url post_comment_url(post_comment, format: :json)
end
