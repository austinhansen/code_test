require 'rails_helper'

describe Pattern, :type => :model do
  it { should validate_presence_of(:minor_x) }
  it { should validate_presence_of(:minor_y) }
  it { should validate_presence_of(:major_x) }
  it { should validate_presence_of(:major_y) }

  it 'should have a valid factory' do
    expect(build :pattern).to be_valid
  end

  it 'should have a grid array when saved' do
    pattern = build(:pattern)
    pattern.save
    expect(pattern.grid).to be_an(Array)
    expect(pattern.grid).to_not eq([])
  end
end
