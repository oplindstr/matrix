require 'rails_helper'

RSpec.describe "event_parameter_values/edit", type: :view do
  before(:each) do
    @event_parameter_value = assign(:event_parameter_value, EventParameterValue.create!(
      :event_parameter_id => 1,
      :signup_id => 1,
      :value => "MyText"
    ))
  end

  it "renders the edit event_parameter_value form" do
    render

    assert_select "form[action=?][method=?]", event_parameter_value_path(@event_parameter_value), "post" do

      assert_select "input#event_parameter_value_event_parameter_id[name=?]", "event_parameter_value[event_parameter_id]"

      assert_select "input#event_parameter_value_signup_id[name=?]", "event_parameter_value[signup_id]"

      assert_select "textarea#event_parameter_value_value[name=?]", "event_parameter_value[value]"
    end
  end
end
