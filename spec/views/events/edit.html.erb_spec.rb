require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "MyString",
      :location => "MyString",
      :type => "",
      :signup_required => false
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_name[name=?]", "event[name]"

      assert_select "input#event_location[name=?]", "event[location]"

      assert_select "input#event_type[name=?]", "event[type]"

      assert_select "input#event_signup_required[name=?]", "event[signup_required]"
    end
  end
end
