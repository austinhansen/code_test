require 'rails_helper'

RSpec.describe "patterns/show", :type => :view do
  before(:each) do
    @pattern = assign(:pattern, Pattern.create!(
      :minor_x => 1,
      :major_x => 2,
      :minor_y => 3,
      :major_y => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
