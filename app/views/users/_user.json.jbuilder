json.extract! user, :id, :login, :full_name, :birthday, :email, :password_confirm, :created_at, :updated_at
json.url user_url(user, format: :json)
