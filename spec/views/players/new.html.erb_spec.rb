require 'rails_helper'

RSpec.describe "players/new", type: :view do
  before(:each) do
    assign(:player, Player.new(
      :name => "MyString",
      :expectation => 1.5,
      :deviation => 1.5
    ))
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do

      assert_select "input#player_name[name=?]", "player[name]"

      assert_select "input#player_expectation[name=?]", "player[expectation]"

      assert_select "input#player_deviation[name=?]", "player[deviation]"
    end
  end
end
