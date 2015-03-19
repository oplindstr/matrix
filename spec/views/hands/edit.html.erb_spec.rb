require 'rails_helper'

RSpec.describe "hands/edit", type: :view do
  before(:each) do
    @hand = assign(:hand, Hand.create!(
      :match_id => 1,
      :points1 => 1,
      :points2 => 1,
      :declarer => 1,
      :bid => 1,
      :contract => 1,
      :made => false
    ))
  end

  it "renders the edit hand form" do
    render

    assert_select "form[action=?][method=?]", hand_path(@hand), "post" do

      assert_select "input#hand_match_id[name=?]", "hand[match_id]"

      assert_select "input#hand_points1[name=?]", "hand[points1]"

      assert_select "input#hand_points2[name=?]", "hand[points2]"

      assert_select "input#hand_declarer[name=?]", "hand[declarer]"

      assert_select "input#hand_bid[name=?]", "hand[bid]"

      assert_select "input#hand_contract[name=?]", "hand[contract]"

      assert_select "input#hand_made[name=?]", "hand[made]"
    end
  end
end
