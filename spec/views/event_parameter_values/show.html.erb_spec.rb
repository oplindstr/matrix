require 'rails_helper'

RSpec.describe "event_parameter_values/show", type: :view do
  before(:each) do
    @event_parameter_value = assign(:event_parameter_value, EventParameterValue.create!(
      :event_parameter_id => 2,
      :signup_id => 3,
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
