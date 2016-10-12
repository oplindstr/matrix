require 'rails_helper'

RSpec.describe "document_groups/show", type: :view do
  before(:each) do
    @document_group = assign(:document_group, DocumentGroup.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
