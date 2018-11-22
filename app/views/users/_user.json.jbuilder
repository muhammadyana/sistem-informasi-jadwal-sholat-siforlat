json.extract! user, :id, :email, :first_name, :last_name, :mobile_phone, :address, :date_of_birth, :created_at, :updated_at
json.url user_url(user, format: :json)
