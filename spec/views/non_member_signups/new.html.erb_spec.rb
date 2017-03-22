require 'rails_helper'

RSpec.describe "non_member_signups/new", type: :view do
  before(:each) do
    assign(:non_member_signup, NonMemberSignup.new(
      :event_id => 1,
      :name => "MyString",
      :email => "MyString",
      :phonenumber => "MyString"
    ))
  end

  it "renders new non_member_signup form" do
    render

    assert_select "form[action=?][method=?]", non_member_signups_path, "post" do

      assert_select "input#non_member_signup_event_id[name=?]", "non_member_signup[event_id]"

      assert_select "input#non_member_signup_name[name=?]", "non_member_signup[name]"

      assert_select "input#non_member_signup_email[name=?]", "non_member_signup[email]"

      assert_select "input#non_member_signup_phonenumber[name=?]", "non_member_signup[phonenumber]"
    end
  end
end
