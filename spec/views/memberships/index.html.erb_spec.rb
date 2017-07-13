require 'rails_helper'

RSpec.describe "memberships/index", type: :view do
  before(:each) do
    assign(:memberships, [
      Membership.create!(
        :user_id => 2,
        :year => 3
      ),
      Membership.create!(
        :user_id => 2,
        :year => 3
      )
    ])
  end

  it "renders a list of memberships" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
