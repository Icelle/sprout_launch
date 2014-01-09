require 'spec_helper'

feature 'user signs up', %Q{
 As an unauthenticated user
 I want to sign up
 So that I can access the website
} do
  # There is an option to sign in on the main page if user is not already a member and not yet authenticated.
  # If user is not an authenticated user, must be prompted to sign up
  #If user is an authenticated user, user doesn't have the option to sign in.
  #User must have valid first name, last name and email to sign up.
  #If user doesn't enter valid credentials, user received an error message and is left unauthneticated.
  #If user enters valid credentials, user received onscreen message that user successfully signed up and user can gain access to the system.
  #User will be sent a welcome email in his valid email address with a link confirming that user signed up for the website.

  let(:user) { FactoryGirl.build(:user) }

  scenario 'new user: specifies valid information, successfully signs up' do
    #clear out mail deliveries
    ActionMailer::Base.deliveries = []
    prev_count = User.count

    visit new_user_registration_path
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password, exact: true
    fill_in 'user_password_confirmation', with: user.password_confirmation, exact: true
    click_button "Sign Up"

    expect(page).to have_content('Thank you for signing up.')
    expect(User.count).to eql(prev_count + 1)

    #expect email details pertaining to the confirmation
    expect(ActionMailer::Base.deliveries.size).to eql(1)
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject('Welcome to Sprout!')
    expect(last_email).to deliver_to('icelleku@gmail.com')
  end

  scenario 'does not specify valid information, user sees errors' do
    visit new_user_registration_path
    click_button "Sign Up"
    expect(page).to have_content "can't be blank"
    expect(page).to have_content "can't be blank"
    expect(page).to have_content "can't be blank"
  end
end
