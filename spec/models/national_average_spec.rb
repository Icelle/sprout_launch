require 'spec_helper'

describe NationalAverage do
  # For example, to obtain the weight-for-age z-score of a 9-month-old male who weighs 9.7 kg, we would look up the L, M and S values from the WTAGEINF table, which are L=-0.1600954, M=9.476500305, and S=0.11218624. Using the equation above, we calculate that the z-score for this child is 0.207.
  it 'should give a z-score' do
    n = NationalAverage.where("agemos = 9.5 and gender = 'male' and stat_type = 'weight'").first
    expect(n.z_score(9.7)).to be_within(0.01).of(0.207)
  end

  # This z-score corresponds to the 58th percentile.
  it 'should give a percentile' do
    n = NationalAverage.where("agemos = 9.5 and gender = 'male' and stat_type = 'weight'").first
    percentile = n.percentile(9.7)
    expect(percentile).to be_within(0.1).of(58.0)
  end
end
