require 'rails_helper'

RSpec.describe "members/new", type: :view do
  before(:each) do
    assign(:member, Member.new(
      :firstname => "MyString",
      :lastname => "MyString",
      :address => "MyString",
      :email => "MyString",
      :city => "MyString"
    ))
  end

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do

      assert_select "input#member_firstname[name=?]", "member[firstname]"

      assert_select "input#member_lastname[name=?]", "member[lastname]"

      assert_select "input#member_address[name=?]", "member[address]"

      assert_select "input#member_email[name=?]", "member[email]"

      assert_select "input#member_city[name=?]", "member[city]"
    end
  end
end
