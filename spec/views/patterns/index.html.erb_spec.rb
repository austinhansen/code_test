require 'rails_helper'

RSpec.describe "patterns/index", :type => :view do
  before(:each) do
    assign(:patterns, [
      Pattern.create!(
        :minor_x => 1,
        :major_x => 2,
        :minor_y => 3,
        :major_y => 4
      ),
      Pattern.create!(
        :minor_x => 1,
        :major_x => 2,
        :minor_y => 3,
        :major_y => 4
      )
    ])
  end

  it "renders a list of patterns" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
