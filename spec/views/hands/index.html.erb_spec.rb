require 'rails_helper'

RSpec.describe "hands/index", type: :view do
  before(:each) do
    assign(:hands, [
      Hand.create!(
        :match_id => 1,
        :points1 => 2,
        :points2 => 3,
        :declarer => 4,
        :bid => 5,
        :contract => 6,
        :made => false
      ),
      Hand.create!(
        :match_id => 1,
        :points1 => 2,
        :points2 => 3,
        :declarer => 4,
        :bid => 5,
        :contract => 6,
        :made => false
      )
    ])
  end

  it "renders a list of hands" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
