# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Icelle"
    last_name "Ku"
    sequence(:email) {|x| "test#{x}@email.com"}
    password "koakoakoa"
    password_confirmation "koakoakoa"
  end
end
