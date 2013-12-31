# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "Name"
    user_name "userNAME"
    sequence(:email) {|x| "test#{x}@email.com"}
    password "MyString"
  end
end
