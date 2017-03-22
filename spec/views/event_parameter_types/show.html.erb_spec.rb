require 'rails_helper'

RSpec.describe "event_parameter_types/show", type: :view do
  before(:each) do
    @event_parameter_type = assign(:event_parameter_type, EventParameterType.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
