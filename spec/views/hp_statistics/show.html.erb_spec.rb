require 'rails_helper'

RSpec.describe "hp_statistics/show", type: :view do
  before(:each) do
    @hp_statistic = assign(:hp_statistic, HpStatistic.create!(
      :u_id => 1,
      :expectation => 1.5,
      :deviation => 1.5,
      :assurity => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
