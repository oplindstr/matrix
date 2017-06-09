require 'rails_helper'

RSpec.describe "event_parameter_choices/new", type: :view do
  before(:each) do
    assign(:event_parameter_choice, EventParameterChoice.new(
      :event_parameter_id => 1,
      :value => "MyString"
    ))
  end

  it "renders new event_parameter_choice form" do
    render

    assert_select "form[action=?][method=?]", event_parameter_choices_path, "post" do

      assert_select "input#event_parameter_choice_event_parameter_id[name=?]", "event_parameter_choice[event_parameter_id]"

      assert_select "input#event_parameter_choice_value[name=?]", "event_parameter_choice[value]"
    end
  end
end
