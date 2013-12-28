require 'spec_helper'

describe Person do
  it {should have_valid(:first_name).when('Icelle')}
  it {should_not have_valid(:first_name).when('', nil)}
  it {should have_valid(:last_name).when('Ku')}
  it {should_not have_valid(:last_name).when('', nil)}
  it {should have_valid(:gender).when('male')}
  it {should have_valid(:gender).when('female')}
  it {should_not have_valid(:gender).when('', nil)}
  it {should_not have_valid(:gender).when('xaheqfldj')}
  it {should_not have_valid(:birthday).when(0)}
  it {should have_valid(:birthday).when(Date.parse('dec-23-1984'))}
  it {should_not have_valid(:birthday).when(Date.parse('dec-23-2050'))}
  it {should_not have_valid(:birthday).when('', nil)}

  it {should belong_to :user}

  it { should have_many(:measurements) }
end
