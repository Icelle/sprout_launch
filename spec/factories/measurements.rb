# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :measurement do
    height ""
    weight ""
    person_id ""
    user_id 1
    person nil
  end
end
