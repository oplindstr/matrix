require 'rails_helper'

RSpec.describe "members/edit", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      :firstname => "MyString",
      :lastname => "MyString",
      :address => "MyString",
      :email => "MyString",
      :city => "MyString"
    ))
  end

  it "renders the edit member form" do
    render

    assert_select "form[action=?][method=?]", member_path(@member), "post" do

      assert_select "input#member_firstname[name=?]", "member[firstname]"

      assert_select "input#member_lastname[name=?]", "member[lastname]"

      assert_select "input#member_address[name=?]", "member[address]"

      assert_select "input#member_email[name=?]", "member[email]"

      assert_select "input#member_city[name=?]", "member[city]"
    end
  end
end
