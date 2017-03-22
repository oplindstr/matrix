require 'rails_helper'

RSpec.describe "non_member_signups/index", type: :view do
  before(:each) do
    assign(:non_member_signups, [
      NonMemberSignup.create!(
        :event_id => 2,
        :name => "Name",
        :email => "Email",
        :phonenumber => "Phonenumber"
      ),
      NonMemberSignup.create!(
        :event_id => 2,
        :name => "Name",
        :email => "Email",
        :phonenumber => "Phonenumber"
      )
    ])
  end

  it "renders a list of non_member_signups" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phonenumber".to_s, :count => 2
  end
end
