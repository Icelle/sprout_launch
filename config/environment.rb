# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Sprout::Application.initialize!

Sprout::Application.configure do
  # access these via Rails.configuration, e.g. Rails.configuration.urls[:homepage]
  config.urls = {
    homepage: "http://sprout.icelle.com",
    sign_in: "http://sprout.icelle.com/users/sign_in"
  }

  config.mandrill_mailer = Mandrill::API.new("QrSfN11kFNdZZbIRcDCUBQ")
end
