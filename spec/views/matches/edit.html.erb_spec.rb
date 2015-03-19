require 'rails_helper'

RSpec.describe "matches/edit", type: :view do
  before(:each) do
    @match = assign(:match, Match.create!(
      :player1 => 1,
      :player2 => 1,
      :player3 => 1,
      :player4 => 1,
      :winners => 1
    ))
  end

  it "renders the edit match form" do
    render

    assert_select "form[action=?][method=?]", match_path(@match), "post" do

      assert_select "input#match_player1[name=?]", "match[player1]"

      assert_select "input#match_player2[name=?]", "match[player2]"

      assert_select "input#match_player3[name=?]", "match[player3]"

      assert_select "input#match_player4[name=?]", "match[player4]"

      assert_select "input#match_winners[name=?]", "match[winners]"
    end
  end
end
