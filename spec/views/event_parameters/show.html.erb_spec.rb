require 'rails_helper'

RSpec.describe "event_parameters/show", type: :view do
  before(:each) do
    @event_parameter = assign(:event_parameter, EventParameter.create!(
      :event_id => 2,
      :name => "Name",
      :event_parameter_type_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/3/)
  end
end
