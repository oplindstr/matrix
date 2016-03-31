require 'rails_helper'

RSpec.describe "post_comments/index", type: :view do
  before(:each) do
    assign(:post_comments, [
      PostComment.create!(
        :post_id => 1,
        :user_id => 2,
        :comment => "MyText"
      ),
      PostComment.create!(
        :post_id => 1,
        :user_id => 2,
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of post_comments" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
