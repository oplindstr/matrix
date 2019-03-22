require 'rails_helper'

RSpec.describe "partners/index", type: :view do
  before(:each) do
    assign(:partners, [
      Partner.create!(
        :name => "Name",
        :image => "Image"
      ),
      Partner.create!(
        :name => "Name",
        :image => "Image"
      )
    ])
  end

  it "renders a list of partners" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
