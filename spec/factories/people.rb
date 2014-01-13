# Read about factories at https://github.com/thoughtbot/factory_girl
require 'date'
FactoryGirl.define do
  factory :person do
    first_name "Koa"
    last_name "Brickley"
    gender "female"
    birthday "2011-12-04"
    user

  trait :male do
    name   "Baby Boy"
    gender "Male"
  end

  trait :female do
    name   "Baby Girl"
    gender "Female"
  end

  factory :person_with_measurements do
    after(:create) do |p|
       p.measurements << FactoryGirl.create(:measurement_height, {as_of_dt: Date.new(2012,1,4)})
       p.measurements << FactoryGirl.create(:measurement_height, {as_of_dt: Date.new(2012,2,4)})
       p.measurements << FactoryGirl.create(:measurement_height, {as_of_dt: Date.new(2012,3,15)})
     end
  end

  factory :person_with_measurement do
    after(:create) do |p|
       p.measurements << FactoryGirl.create(:measurement_height, {as_of_dt: Date.new(2012,9,1)})
     end
  end

  factory :person_male,   traits: [:male]
  factory :person_female, traits: [:female]

  end
end
