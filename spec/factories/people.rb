# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    first_name "Koa"
    last_name "Brickley"
    gender "female"
    birthday "2013-12-28"
    user
  end
end
