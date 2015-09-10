json.array!(@stringresources) do |stringresource|
  json.extract! stringresource, :id, :key, :value
  json.url stringresource_url(stringresource, format: :json)
end
