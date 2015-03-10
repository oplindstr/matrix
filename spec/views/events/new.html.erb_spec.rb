require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :name => "MyString",
      :location => "MyString",
      :type => "",
      :signup_required => false
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_name[name=?]", "event[name]"

      assert_select "input#event_location[name=?]", "event[location]"

      assert_select "input#event_type[name=?]", "event[type]"

      assert_select "input#event_signup_required[name=?]", "event[signup_required]"
    end
  end
end
