# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    first_name ""
    last_name ""
    gender ""
    birthday "2013-12-28"
    user nil
  end
end
