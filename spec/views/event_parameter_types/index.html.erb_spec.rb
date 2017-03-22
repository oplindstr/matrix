require 'rails_helper'

RSpec.describe "event_parameter_types/index", type: :view do
  before(:each) do
    assign(:event_parameter_types, [
      EventParameterType.create!(
        :name => "Name"
      ),
      EventParameterType.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of event_parameter_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
