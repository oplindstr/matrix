require 'rails_helper'

RSpec.describe "document_groups/index", type: :view do
  before(:each) do
    assign(:document_groups, [
      DocumentGroup.create!(
        :name => "Name"
      ),
      DocumentGroup.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of document_groups" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
