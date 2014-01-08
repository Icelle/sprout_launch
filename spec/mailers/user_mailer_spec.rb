require "spec_helper"

describe "Sign up email" do
  it "should deliver the sign up email" do
    # expect
    UserMailer.should_receive(:deliver_signup).with("icelleku@gmail.com", "Icelle Ku")
    # when
    post :signup, "Email" => "icelle@gmail.com", "Name" => "Icelle Ku"
  end
end

# describe UserMailer do
#   context "Signup Email" do
#     include EmailSpec::Helpers
#     include EmailSpec::Matchers
#     # include ActionController::UrlWriter - old rails
#     include Rails.application.routes.url_helpers

#     before(:all) do
#       @email = UserMailer.create_signup("icelleku@gmail.com", "Icelle Ku")
#     end

#     it "should be set to be delivered to the email passed in" do
#       @user.email.should deliver_to("icelleku@gmail.com")
#     end

#     it "should contain message in the mail body" do
#       @user.email.should have_body_text(/Thank you for signing up!/)
#     end

#     it "should contain a link to the confirmation link" do
#       @user.email.should have_body_text(/#{confirm_account_url}/)
#     end

#     it "should have the correct subject" do
#       @user.email.should have_subject(/Account Confirmation. Welcome to Sprout./)
#     end
#   end
# end
