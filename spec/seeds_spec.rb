require Rails.root + 'db/seeds.rb'
require 'spec_helper'

describe 'DB Seed' do
  it 'load height data' do
    load_data
    expect(NationalAverage.all.count).to eq (1023)
  end

  it 'scrubs data' do
    row = {"Sex"=>"1", "Agemos"=>"24", "L"=>"0.941523967", "M"=>"86.45220101", "S"=>"0.040321528", "P3"=>"79.91084447", "P5"=>"80.72977321", "P10"=>"81.99171445", "P25"=>"84.10289217", "P50"=>"86.45220101", "P75"=>"88.80524943", "P90"=>"90.92619137", "P95"=>"92.19687928", "P97"=>"93.02265441"}
    expect(scrub_row(row, "height")).to eq(
    {"gender"=>"M",
     "agemos"=>"24",
     "l"=>"0.941523967",
     "m"=>"86.45220101",
     "s"=>"0.040321528",
     "p50"=>"86.45220101",
     "stat_type" => "height"})
  end
end
