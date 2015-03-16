require 'rails_helper'

RSpec.describe "hp_statistics/index", type: :view do
  before(:each) do
    assign(:hp_statistics, [
      HpStatistic.create!(
        :u_id => 1,
        :expectation => 1.5,
        :deviation => 1.5,
        :assurity => 1.5
      ),
      HpStatistic.create!(
        :u_id => 1,
        :expectation => 1.5,
        :deviation => 1.5,
        :assurity => 1.5
      )
    ])
  end

  it "renders a list of hp_statistics" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
