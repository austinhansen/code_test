require 'rails_helper'

describe Pattern, :type => :model do
  it { should validate_presence_of(:minor_x) }
  it { should validate_presence_of(:minor_y) }
  it { should validate_presence_of(:major_x) }
  it { should validate_presence_of(:major_y) }

  it 'should have a valid factory' do
    expect(build :pattern).to be_valid
  end

  it 'should generate a grid string from x and y values' do
    pattern = create(:pattern, minor_x: 4, major_x: 4, minor_y: 4, major_y: 5)
    expect(pattern.grid).to be_a(Array)
  end

  it 'should have an alternative pattern when major_x is odd' do
    pattern = create(:pattern, minor_x: 4, major_x: 3, minor_y: 1, major_y: 5)
    expect(pattern.grid[0]).not_to eq(pattern.grid[1])
  end
end
