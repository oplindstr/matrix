require 'rails_helper'

RSpec.describe "event_parameter_choices/index", type: :view do
  before(:each) do
    assign(:event_parameter_choices, [
      EventParameterChoice.create!(
        :event_parameter_id => 2,
        :value => "Value"
      ),
      EventParameterChoice.create!(
        :event_parameter_id => 2,
        :value => "Value"
      )
    ])
  end

  it "renders a list of event_parameter_choices" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
