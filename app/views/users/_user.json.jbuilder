json.extract! user, :id, :login, :full_name, :birthday, :email, :adress, :state, :city, :country, :zip, :password, :password_confirm, :created_at, :updated_at
json.url user_url(user, format: :json)
