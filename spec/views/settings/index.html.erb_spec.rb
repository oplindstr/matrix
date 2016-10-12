require 'rails_helper'

RSpec.describe "settings/index", type: :view do
  before(:each) do
    assign(:settings, [
      Setting.create!(
        :setting => "Setting",
        :value => "MyText"
      ),
      Setting.create!(
        :setting => "Setting",
        :value => "MyText"
      )
    ])
  end

  it "renders a list of settings" do
    render
    assert_select "tr>td", :text => "Setting".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
