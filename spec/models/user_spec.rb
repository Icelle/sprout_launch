require 'spec_helper'

describe User do
  it {should have_valid(:first_name).when('Icelle')}
  it {should_not have_valid(:first_name).when('', nil)}
  it {should have_valid(:last_name).when('Ku')}
  it {should_not have_valid(:last_name).when('', nil)}
  it {should have_valid(:email).when('icelleku@gmail.com')}
  it {should_not have_valid(:email).when('', nil, 'abc123')}
  it {should have_valid(:password).when('abc123asdd')}
  it {should_not have_valid(:password).when('', nil)}

  it { should have_many(:persons) }
end
