json.extract! advertisement, :id, :user_id, :text, :image, :post_pic, :created_at, :updated_at
json.url advertisement_url(advertisement, format: :json)
