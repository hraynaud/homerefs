# Load the rails application
require File.expand_path('../application', __FILE__)

S3_BUCKET_NAME = ENV['S3_BUCKET_NAME']
AWS_ACCESS_KEY_ID = ENV['AWS_ACCESS_KEY_ID']
AWS_SECRET_ACCESS_KEY = ENV['AWS_SECRET_ACCESS_KEY']
# Initialize the rails application
Homerefs::Application.initialize!

