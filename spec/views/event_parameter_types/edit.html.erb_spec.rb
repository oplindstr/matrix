require 'rails_helper'

RSpec.describe "event_parameter_types/edit", type: :view do
  before(:each) do
    @event_parameter_type = assign(:event_parameter_type, EventParameterType.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit event_parameter_type form" do
    render

    assert_select "form[action=?][method=?]", event_parameter_type_path(@event_parameter_type), "post" do

      assert_select "input#event_parameter_type_name[name=?]", "event_parameter_type[name]"
    end
  end
end
