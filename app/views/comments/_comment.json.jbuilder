json.extract! comment, :id, :user_id, :advertisment_id, :message, :created_at, :updated_at
json.url comment_url(comment, format: :json)
