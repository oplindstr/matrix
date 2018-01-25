json.extract! member, :id, :firstname, :lastname, :address, :email, :city, :created_at, :updated_at
json.url member_url(member, format: :json)
