require 'rails_helper'

RSpec.describe "patterns/new", :type => :view do
  before(:each) do
    assign(:pattern, Pattern.new(
      :minor_x => 1,
      :major_x => 1,
      :minor_y => 1,
      :major_y => 1
    ))
  end

  it "renders new pattern form" do
    render

    assert_select "form[action=?][method=?]", patterns_path, "post" do

      assert_select "input#pattern_minor_x[name=?]", "pattern[minor_x]"

      assert_select "input#pattern_major_x[name=?]", "pattern[major_x]"

      assert_select "input#pattern_minor_y[name=?]", "pattern[minor_y]"

      assert_select "input#pattern_major_y[name=?]", "pattern[major_y]"
    end
  end
end
