json.extract! reservation, :id, :confirmation_num, :category, :amenities, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
