require 'rails_helper'

RSpec.describe "texts/show", type: :view do
  before(:each) do
    @text = assign(:text, Text.create!(
      :name => "Name",
      :value => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
