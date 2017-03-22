require 'rails_helper'

RSpec.describe "event_parameters/new", type: :view do
  before(:each) do
    assign(:event_parameter, EventParameter.new(
      :event_id => 1,
      :name => "MyString",
      :event_parameter_type_id => 1
    ))
  end

  it "renders new event_parameter form" do
    render

    assert_select "form[action=?][method=?]", event_parameters_path, "post" do

      assert_select "input#event_parameter_event_id[name=?]", "event_parameter[event_id]"

      assert_select "input#event_parameter_name[name=?]", "event_parameter[name]"

      assert_select "input#event_parameter_event_parameter_type_id[name=?]", "event_parameter[event_parameter_type_id]"
    end
  end
end
