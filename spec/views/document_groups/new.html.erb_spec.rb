require 'rails_helper'

RSpec.describe "document_groups/new", type: :view do
  before(:each) do
    assign(:document_group, DocumentGroup.new(
      :name => "MyString"
    ))
  end

  it "renders new document_group form" do
    render

    assert_select "form[action=?][method=?]", document_groups_path, "post" do

      assert_select "input#document_group_name[name=?]", "document_group[name]"
    end
  end
end
