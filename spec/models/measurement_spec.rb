require 'spec_helper'

describe Measurement do
  describe 'validations' do
    let(:measurement) {FactoryGirl.build(:measurement)}

    it 'is valid when it has all required and valid attributes' do
      expect(measurement).to be_valid
    end

    it {should have_valid(:measurement_type).when('weight', 'height')}
    it {should_not have_valid(:measurement_type).when('', nil, 'abc', 1)}
    it {should have_valid(:value).when(20.5, 100)}
    it {should_not have_valid(:value).when('', nil, -1, -2.3, 0, "a")}

    it {should belong_to :person}
  end

  it 'should calculate age in months' do
    p = FactoryGirl.create(:person_with_measurement)
    m = p.measurements.first
    expect(m.age_mos).to be_within(0.1).of(9)
  end

  it 'should find the corresponding National Average' do
    p = FactoryGirl.create(:person_with_measurement, gender: "male")
    m = p.measurements.first
    # TODO: test both match conditions
    expect((m.get_national_avg).agemos).to be_within(1).of(m.age_mos)

    # get percentile
    expect(m.percentile).to be_within(0.1).of(58)
  end
end
