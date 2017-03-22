require 'rails_helper'

RSpec.describe "event_parameter_values/index", type: :view do
  before(:each) do
    assign(:event_parameter_values, [
      EventParameterValue.create!(
        :event_parameter_id => 2,
        :signup_id => 3,
        :value => "MyText"
      ),
      EventParameterValue.create!(
        :event_parameter_id => 2,
        :signup_id => 3,
        :value => "MyText"
      )
    ])
  end

  it "renders a list of event_parameter_values" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
