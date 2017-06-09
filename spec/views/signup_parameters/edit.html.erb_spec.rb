require 'rails_helper'

RSpec.describe "signup_parameters/edit", type: :view do
  before(:each) do
    @signup_parameter = assign(:signup_parameter, SignupParameter.create!(
      :signup_id => 1,
      :event_parameter_id => 1,
      :value => "MyString"
    ))
  end

  it "renders the edit signup_parameter form" do
    render

    assert_select "form[action=?][method=?]", signup_parameter_path(@signup_parameter), "post" do

      assert_select "input#signup_parameter_signup_id[name=?]", "signup_parameter[signup_id]"

      assert_select "input#signup_parameter_event_parameter_id[name=?]", "signup_parameter[event_parameter_id]"

      assert_select "input#signup_parameter_value[name=?]", "signup_parameter[value]"
    end
  end
end
