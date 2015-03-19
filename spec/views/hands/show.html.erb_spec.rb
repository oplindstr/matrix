require 'rails_helper'

RSpec.describe "hands/show", type: :view do
  before(:each) do
    @hand = assign(:hand, Hand.create!(
      :match_id => 1,
      :points1 => 2,
      :points2 => 3,
      :declarer => 4,
      :bid => 5,
      :contract => 6,
      :made => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/false/)
  end
end
