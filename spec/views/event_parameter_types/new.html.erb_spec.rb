require 'rails_helper'

RSpec.describe "event_parameter_types/new", type: :view do
  before(:each) do
    assign(:event_parameter_type, EventParameterType.new(
      :name => "MyString"
    ))
  end

  it "renders new event_parameter_type form" do
    render

    assert_select "form[action=?][method=?]", event_parameter_types_path, "post" do

      assert_select "input#event_parameter_type_name[name=?]", "event_parameter_type[name]"
    end
  end
end
