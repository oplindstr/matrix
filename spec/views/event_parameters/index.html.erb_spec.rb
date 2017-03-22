require 'rails_helper'

RSpec.describe "event_parameters/index", type: :view do
  before(:each) do
    assign(:event_parameters, [
      EventParameter.create!(
        :event_id => 2,
        :name => "Name",
        :event_parameter_type_id => 3
      ),
      EventParameter.create!(
        :event_id => 2,
        :name => "Name",
        :event_parameter_type_id => 3
      )
    ])
  end

  it "renders a list of event_parameters" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
