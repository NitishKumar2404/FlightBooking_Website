json.extract! user, :id, :name, :card, :address, :mobile, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
