# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :measurement do
    height 9.99
    weight 9.99
    person
  end
end
