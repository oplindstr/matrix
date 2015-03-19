require 'rails_helper'

RSpec.describe "matches/index", type: :view do
  before(:each) do
    assign(:matches, [
      Match.create!(
        :player1 => 1,
        :player2 => 2,
        :player3 => 3,
        :player4 => 4,
        :winners => 5
      ),
      Match.create!(
        :player1 => 1,
        :player2 => 2,
        :player3 => 3,
        :player4 => 4,
        :winners => 5
      )
    ])
  end

  it "renders a list of matches" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
