json.array!(@document_groups) do |document_group|
  json.extract! document_group, :id, :name
  json.url document_group_url(document_group, format: :json)
end
