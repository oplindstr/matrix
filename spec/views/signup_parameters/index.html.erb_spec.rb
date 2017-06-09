require 'rails_helper'

RSpec.describe "signup_parameters/index", type: :view do
  before(:each) do
    assign(:signup_parameters, [
      SignupParameter.create!(
        :signup_id => 2,
        :event_parameter_id => 3,
        :value => "Value"
      ),
      SignupParameter.create!(
        :signup_id => 2,
        :event_parameter_id => 3,
        :value => "Value"
      )
    ])
  end

  it "renders a list of signup_parameters" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
