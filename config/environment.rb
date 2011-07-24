# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Highfives::Application.initialize!

Highfives::Application.configure do
config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :enable_starttls_auto => true,
    :address => 'smtp.gmail.com',
    :port => "587",
    :authentication => :plain,                                                                                                                     
    :domain => 'highfivetuesdays.com',
    :user_name => 'highfivetuesdays@happygastropod.com',
    :password => 'upa84UB3#BsqMTz'
  }
end