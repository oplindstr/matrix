require 'rails_helper'

RSpec.describe "signup_parameters/show", type: :view do
  before(:each) do
    @signup_parameter = assign(:signup_parameter, SignupParameter.create!(
      :signup_id => 2,
      :event_parameter_id => 3,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Value/)
  end
end
