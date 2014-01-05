# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    first_name "Koa"
    last_name "Brickley"
    gender "female"
    birthday "2013-12-28"
    user

  trait :male do
    name   "Baby Boy"
    gender "Male"
  end

  trait :female do
    name   "Baby Girl"
    gender "Female"
  end

  factory :person_male,   traits: [:male]
  factory :person_female, traits: [:female]

  end
end
