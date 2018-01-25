require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :address => "Address",
        :email => "Email",
        :city => "City"
      ),
      Member.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :address => "Address",
        :email => "Email",
        :city => "City"
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
  end
end
