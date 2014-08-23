require 'rails_helper'

RSpec.describe "patterns/edit", :type => :view do
  before(:each) do
    @pattern = assign(:pattern, Pattern.create!(
      :minor_x => 1,
      :major_x => 1,
      :minor_y => 1,
      :major_y => 1
    ))
  end

  it "renders the edit pattern form" do
    render

    assert_select "form[action=?][method=?]", pattern_path(@pattern), "post" do

      assert_select "input#pattern_minor_x[name=?]", "pattern[minor_x]"

      assert_select "input#pattern_major_x[name=?]", "pattern[major_x]"

      assert_select "input#pattern_minor_y[name=?]", "pattern[minor_y]"

      assert_select "input#pattern_major_y[name=?]", "pattern[major_y]"
    end
  end
end
