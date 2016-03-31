require 'rails_helper'

RSpec.describe "post_comments/new", type: :view do
  before(:each) do
    assign(:post_comment, PostComment.new(
      :post_id => 1,
      :user_id => 1,
      :comment => "MyText"
    ))
  end

  it "renders new post_comment form" do
    render

    assert_select "form[action=?][method=?]", post_comments_path, "post" do

      assert_select "input#post_comment_post_id[name=?]", "post_comment[post_id]"

      assert_select "input#post_comment_user_id[name=?]", "post_comment[user_id]"

      assert_select "textarea#post_comment_comment[name=?]", "post_comment[comment]"
    end
  end
end
