require 'rails_helper'

RSpec.describe "document_group_categories/edit", type: :view do
  before(:each) do
    @document_group_category = assign(:document_group_category, DocumentGroupCategory.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit document_group_category form" do
    render

    assert_select "form[action=?][method=?]", document_group_category_path(@document_group_category), "post" do

      assert_select "input#document_group_category_name[name=?]", "document_group_category[name]"
    end
  end
end
