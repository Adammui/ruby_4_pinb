Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           Rails.application.credentials[:Client_ID],
           Rails.application.credentials[:Client_secret]
end
OmniAuth.config.allowed_request_methods = %i[get]
OmniAuth.config.allowed_request_methods = [:post, :get]