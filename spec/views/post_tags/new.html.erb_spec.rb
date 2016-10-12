require 'rails_helper'

RSpec.describe "post_tags/new", type: :view do
  before(:each) do
    assign(:post_tag, PostTag.new(
      :post_id => 1,
      :tag => "MyString"
    ))
  end

  it "renders new post_tag form" do
    render

    assert_select "form[action=?][method=?]", post_tags_path, "post" do

      assert_select "input#post_tag_post_id[name=?]", "post_tag[post_id]"

      assert_select "input#post_tag_tag[name=?]", "post_tag[tag]"
    end
  end
end
