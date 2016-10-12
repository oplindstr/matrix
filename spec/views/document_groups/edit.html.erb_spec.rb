require 'rails_helper'

RSpec.describe "document_groups/edit", type: :view do
  before(:each) do
    @document_group = assign(:document_group, DocumentGroup.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit document_group form" do
    render

    assert_select "form[action=?][method=?]", document_group_path(@document_group), "post" do

      assert_select "input#document_group_name[name=?]", "document_group[name]"
    end
  end
end
