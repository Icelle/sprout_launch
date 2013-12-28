# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name ""
    email ""
    password "MyString"
  end
end
