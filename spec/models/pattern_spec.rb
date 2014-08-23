require 'rails_helper'

describe Pattern, :type => :model do
  it 'should have a valid factory' do
    expect(build :pattern).to be_valid
  end
end
