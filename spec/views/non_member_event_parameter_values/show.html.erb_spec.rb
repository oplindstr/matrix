require 'rails_helper'

RSpec.describe "non_member_event_parameter_values/show", type: :view do
  before(:each) do
    @non_member_event_parameter_value = assign(:non_member_event_parameter_value, NonMemberEventParameterValue.create!(
      :event_parameter_id => 2,
      :non_member_signup_id => 3,
      :value => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
  end
end
