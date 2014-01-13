# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :measurement do
    measurement_type "height"
    value 9.999
    as_of_dt Date.new(2012,1,4)
    person

    factory :measurement_height_rand do
      measurement_type "height"
      value { (rand()*100).to_i }
    end

    factory :measurement_height do
      measurement_type "weight"
      value 9.7
    end
  end

end
