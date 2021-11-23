Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           "1089113857854-fiv9uuplintt8jm2la1986ld8hpc2kbf.apps.googleusercontent.com",
           "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"
end
OmniAuth.config.allowed_request_methods = %i[get]
OmniAuth.config.allowed_request_methods = [:post, :get]