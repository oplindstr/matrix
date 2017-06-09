require 'rails_helper'

RSpec.describe "signup_parameters/new", type: :view do
  before(:each) do
    assign(:signup_parameter, SignupParameter.new(
      :signup_id => 1,
      :event_parameter_id => 1,
      :value => "MyString"
    ))
  end

  it "renders new signup_parameter form" do
    render

    assert_select "form[action=?][method=?]", signup_parameters_path, "post" do

      assert_select "input#signup_parameter_signup_id[name=?]", "signup_parameter[signup_id]"

      assert_select "input#signup_parameter_event_parameter_id[name=?]", "signup_parameter[event_parameter_id]"

      assert_select "input#signup_parameter_value[name=?]", "signup_parameter[value]"
    end
  end
end
