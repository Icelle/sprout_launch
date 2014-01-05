require 'spec_helper'

describe Measurement do
  describe 'validations' do
    let(:measurement) {FactoryGirl.build(:measurement)}

    it 'is valid when it has all required and valid attributes' do
      expect(measurement).to be_valid
    end

    it {should have_valid(:height).when(275, 275.5)}
    it {should_not have_valid(:height).when('', nil, 'a', 0, -1.0)}
    it {should have_valid(:weight).when(50.5, 50)}
    it {should_not have_valid(:weight).when('', nil, 'a', 0, -1.0)}

    it {should belong_to :person}
  end
end
