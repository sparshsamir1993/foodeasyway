OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  

  # If you want to also configure for additional login services, they would be configured here.
end