require 'spec_helper'

describe Measurement do
  it {should have_valid(:height).when(275, 275.5)}
  it {should_not have_valid(:height).when('', nil, 'a', 0, -1.0)}
  it {should have_valid(:weight).when(50.5, 50)}
  it {should_not have_valid(:weight).when('', nil, 'a', 0, -1.0)}
end
