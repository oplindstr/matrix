require 'rails_helper'

RSpec.describe "document_group_categories/new", type: :view do
  before(:each) do
    assign(:document_group_category, DocumentGroupCategory.new(
      :name => "MyString"
    ))
  end

  it "renders new document_group_category form" do
    render

    assert_select "form[action=?][method=?]", document_group_categories_path, "post" do

      assert_select "input#document_group_category_name[name=?]", "document_group_category[name]"
    end
  end
end
