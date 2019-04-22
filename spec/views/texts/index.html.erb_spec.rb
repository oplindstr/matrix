require 'rails_helper'

RSpec.describe "texts/index", type: :view do
  before(:each) do
    assign(:texts, [
      Text.create!(
        :name => "Name",
        :value => "MyText"
      ),
      Text.create!(
        :name => "Name",
        :value => "MyText"
      )
    ])
  end

  it "renders a list of texts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
