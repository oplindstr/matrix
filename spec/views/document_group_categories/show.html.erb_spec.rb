require 'rails_helper'

RSpec.describe "document_group_categories/show", type: :view do
  before(:each) do
    @document_group_category = assign(:document_group_category, DocumentGroupCategory.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
