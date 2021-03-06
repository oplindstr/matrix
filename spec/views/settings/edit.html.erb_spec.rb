require 'rails_helper'

RSpec.describe "settings/edit", type: :view do
  before(:each) do
    @setting = assign(:setting, Setting.create!(
      :setting => "MyString",
      :value => "MyText"
    ))
  end

  it "renders the edit setting form" do
    render

    assert_select "form[action=?][method=?]", setting_path(@setting), "post" do

      assert_select "input#setting_setting[name=?]", "setting[setting]"

      assert_select "textarea#setting_value[name=?]", "setting[value]"
    end
  end
end
