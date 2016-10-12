require 'rails_helper'

RSpec.describe "document_group_categories/index", type: :view do
  before(:each) do
    assign(:document_group_categories, [
      DocumentGroupCategory.create!(
        :name => "Name"
      ),
      DocumentGroupCategory.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of document_group_categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
