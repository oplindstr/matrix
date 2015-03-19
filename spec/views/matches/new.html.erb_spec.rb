require 'rails_helper'

RSpec.describe "matches/new", type: :view do
  before(:each) do
    assign(:match, Match.new(
      :player1 => 1,
      :player2 => 1,
      :player3 => 1,
      :player4 => 1,
      :winners => 1
    ))
  end

  it "renders new match form" do
    render

    assert_select "form[action=?][method=?]", matches_path, "post" do

      assert_select "input#match_player1[name=?]", "match[player1]"

      assert_select "input#match_player2[name=?]", "match[player2]"

      assert_select "input#match_player3[name=?]", "match[player3]"

      assert_select "input#match_player4[name=?]", "match[player4]"

      assert_select "input#match_winners[name=?]", "match[winners]"
    end
  end
end
