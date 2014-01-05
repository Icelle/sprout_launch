# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Icelle"
    last_name "Ku"
    user_name "icelle"
    sequence(:email) {|x| "test#{x}@email.com"}
    password "koakoa"
  end
end
