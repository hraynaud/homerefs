Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, {scope: 'user_about_me,user_location,email'}
end

