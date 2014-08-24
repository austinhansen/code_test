require 'rails_helper'

describe GridGenerator do

  # Order of input integers is minor_x, major_x, minor_y, major_y
  it "calculates a grid array from four input integers" do
    generator = GridGenerator.new(1, 2, 3, 4)
    generator.generate
    expect(generator.grid).to be_an(Array)
  end

  it 'has an alternating pattern when major_x is odd' do
    generator = GridGenerator.new(4, 3, 1, 2)
    generator.generate
    expect(generator.grid[0]).not_to eq(generator.grid[1])
  end

  it 'has an alternating pattern when major_x is even' do
    generator = GridGenerator.new(4, 4, 1, 2)
    generator.generate
    expect(generator.grid[0]).not_to eq(generator.grid[1])
  end

  it 'has a predicatable pattern based on inputs' do
    generator = GridGenerator.new(2, 3, 2, 3)
    generator.generate
    expect(generator.grid).to eq(["XXOOXX", "XXOOXX", "OOXXOO", "OOXXOO", "XXOOXX", "XXOOXX"])
  end
end

