require 'rails_helper'

RSpec.describe "post_tags/index", type: :view do
  before(:each) do
    assign(:post_tags, [
      PostTag.create!(
        :post_id => 1,
        :tag => "Tag"
      ),
      PostTag.create!(
        :post_id => 1,
        :tag => "Tag"
      )
    ])
  end

  it "renders a list of post_tags" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
  end
end
