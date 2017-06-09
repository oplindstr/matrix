require 'rails_helper'

RSpec.describe "event_parameter_choices/show", type: :view do
  before(:each) do
    @event_parameter_choice = assign(:event_parameter_choice, EventParameterChoice.create!(
      :event_parameter_id => 2,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Value/)
  end
end
