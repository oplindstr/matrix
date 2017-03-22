require 'rails_helper'

RSpec.describe "non_member_signups/show", type: :view do
  before(:each) do
    @non_member_signup = assign(:non_member_signup, NonMemberSignup.create!(
      :event_id => 2,
      :name => "Name",
      :email => "Email",
      :phonenumber => "Phonenumber"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phonenumber/)
  end
end
