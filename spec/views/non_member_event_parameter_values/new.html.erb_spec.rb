require 'rails_helper'

RSpec.describe "non_member_event_parameter_values/new", type: :view do
  before(:each) do
    assign(:non_member_event_parameter_value, NonMemberEventParameterValue.new(
      :event_parameter_id => 1,
      :non_member_signup_id => 1,
      :value => "MyText"
    ))
  end

  it "renders new non_member_event_parameter_value form" do
    render

    assert_select "form[action=?][method=?]", non_member_event_parameter_values_path, "post" do

      assert_select "input#non_member_event_parameter_value_event_parameter_id[name=?]", "non_member_event_parameter_value[event_parameter_id]"

      assert_select "input#non_member_event_parameter_value_non_member_signup_id[name=?]", "non_member_event_parameter_value[non_member_signup_id]"

      assert_select "textarea#non_member_event_parameter_value_value[name=?]", "non_member_event_parameter_value[value]"
    end
  end
end
