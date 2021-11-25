json.extract! advertisement, :id, :user_id, :text, :img, :created_at, :updated_at
json.url advertisement_url(advertisement, format: :json)
