require 'rails_helper'

RSpec.describe "event_parameter_choices/edit", type: :view do
  before(:each) do
    @event_parameter_choice = assign(:event_parameter_choice, EventParameterChoice.create!(
      :event_parameter_id => 1,
      :value => "MyString"
    ))
  end

  it "renders the edit event_parameter_choice form" do
    render

    assert_select "form[action=?][method=?]", event_parameter_choice_path(@event_parameter_choice), "post" do

      assert_select "input#event_parameter_choice_event_parameter_id[name=?]", "event_parameter_choice[event_parameter_id]"

      assert_select "input#event_parameter_choice_value[name=?]", "event_parameter_choice[value]"
    end
  end
end
