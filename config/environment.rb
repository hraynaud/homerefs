# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
FACEBOOK_APP_ID = ENV['FACEBOOK_APP_ID']
FACEBOOK_APP_SECRET = ENV['FACEBOOK_APP_SECRET']
Homerefs::Application.initialize!
