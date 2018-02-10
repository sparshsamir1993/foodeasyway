Rails.application.config.middleware.use OmniAuth::Builder do
    
    provider :facebook,      ENV['977470122361795'], ENV['84d066780d8096440a41f54fa250dd97']
    
  end