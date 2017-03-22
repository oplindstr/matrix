json.extract! non_member_signup, :id, :event_id, :name, :email, :phonenumber, :created_at, :updated_at
json.url non_member_signup_url(non_member_signup, format: :json)