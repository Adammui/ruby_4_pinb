json.extract! user, :id, :login, :full_name, :birthday, :email, :password, :created_at, :updated_at, :authentication_token
json.url user_url(user, format: :json)
