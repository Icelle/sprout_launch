# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'mandrill'
# Initialize the Rails application.
Sprout::Application.initialize!

Sprout::Application.configure do
  # access these via Rails.configuration, e.g. Rails.configuration.urls[:homepage]
  config.urls = {
    homepage: "http://sprout.icelle.com",
    sign_in: "http://sprout.icelle.com/users/sign_in"
  }

  APP_CONFIG = YAML.load_file("#{Rails.root}/config/secrets.yml")[Rails.env]

  config.mandrill_mailer = Mandrill::API.new(APP_CONFIG["mandrill"])

end
