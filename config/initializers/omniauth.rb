OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1620952991515130', 'a9ca597bb058c28aa43181b002017396'

end