require 'rails_helper'

RSpec.describe "post_tags/show", type: :view do
  before(:each) do
    @post_tag = assign(:post_tag, PostTag.create!(
      :post_id => 1,
      :tag => "Tag"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Tag/)
  end
end
