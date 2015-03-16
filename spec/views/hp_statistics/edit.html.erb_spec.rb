require 'rails_helper'

RSpec.describe "hp_statistics/edit", type: :view do
  before(:each) do
    @hp_statistic = assign(:hp_statistic, HpStatistic.create!(
      :u_id => 1,
      :expectation => 1.5,
      :deviation => 1.5,
      :assurity => 1.5
    ))
  end

  it "renders the edit hp_statistic form" do
    render

    assert_select "form[action=?][method=?]", hp_statistic_path(@hp_statistic), "post" do

      assert_select "input#hp_statistic_u_id[name=?]", "hp_statistic[u_id]"

      assert_select "input#hp_statistic_expectation[name=?]", "hp_statistic[expectation]"

      assert_select "input#hp_statistic_deviation[name=?]", "hp_statistic[deviation]"

      assert_select "input#hp_statistic_assurity[name=?]", "hp_statistic[assurity]"
    end
  end
end
