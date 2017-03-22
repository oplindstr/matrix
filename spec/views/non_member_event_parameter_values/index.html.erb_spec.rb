require 'rails_helper'

RSpec.describe "non_member_event_parameter_values/index", type: :view do
  before(:each) do
    assign(:non_member_event_parameter_values, [
      NonMemberEventParameterValue.create!(
        :event_parameter_id => 2,
        :non_member_signup_id => 3,
        :value => "MyText"
      ),
      NonMemberEventParameterValue.create!(
        :event_parameter_id => 2,
        :non_member_signup_id => 3,
        :value => "MyText"
      )
    ])
  end

  it "renders a list of non_member_event_parameter_values" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
