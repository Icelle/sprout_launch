# Read about factories at https://github.com/thoughtbot/factory_girl
require 'date'
FactoryGirl.define do
  factory :person do
    first_name "Koa"
    last_name "Brickley"
    gender "female"
    birthday "2011-12-04"
    user nil

  factory :person_with_measurements do
    after(:create) do |p|
       p.measurements << FactoryGirl.create(:measurement_height_rand, {as_of_dt: Date.new(2012,1,4)})
       p.measurements << FactoryGirl.create(:measurement_height_rand, {as_of_dt: Date.new(2012,2,4)})
       p.measurements << FactoryGirl.create(:measurement_height_rand, {as_of_dt: Date.new(2012,3,15)})
       p.measurements << FactoryGirl.create(:measurement_height_rand, {as_of_dt: Date.new(2012,4,15)})
       p.measurements << FactoryGirl.create(:measurement_height_rand, {as_of_dt: Date.new(2012,5,15)})
       p.measurements << FactoryGirl.create(:measurement_height_rand, {as_of_dt: Date.new(2012,6,15)})
       p.measurements << FactoryGirl.create(:measurement_height_rand, {as_of_dt: Date.new(2012,7,15)})
       p.measurements << FactoryGirl.create(:measurement_height_rand, {as_of_dt: Date.new(2012,8,15)})
       p.measurements << FactoryGirl.create(:measurement_height_rand, {as_of_dt: Date.new(2012,9,15)})
       p.measurements << FactoryGirl.create(:measurement_height_rand, {as_of_dt: Date.new(2012,10,15)})
       p.measurements << FactoryGirl.create(:measurement_height_rand, {as_of_dt: Date.new(2012,11,15)})
       p.measurements << FactoryGirl.create(:measurement_height_rand, {as_of_dt: Date.new(2012,12,15)})
     end
  end

  factory :person_with_measurement do
    after(:create) do |p|
       p.measurements << FactoryGirl.create(:measurement_height, {as_of_dt: Date.new(2012,9,1)})
     end
  end

  trait :male do
    first_name "Baby"
    last_name "Boy"
    gender "male"
  end

  trait :female do
    first_name  "Baby"
    last_name "Girl"
    gender "female"
  end

  factory :person_male,   traits: [:male]
  factory :person_female, traits: [:female]

  end
end
