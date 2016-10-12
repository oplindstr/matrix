json.array!(@document_group_categories) do |document_group_category|
  json.extract! document_group_category, :id, :name
  json.url document_group_category_url(document_group_category, format: :json)
end
