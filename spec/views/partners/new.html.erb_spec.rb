require 'rails_helper'

RSpec.describe "partners/new", type: :view do
  before(:each) do
    assign(:partner, Partner.new(
      :name => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new partner form" do
    render

    assert_select "form[action=?][method=?]", partners_path, "post" do

      assert_select "input#partner_name[name=?]", "partner[name]"

      assert_select "input#partner_image[name=?]", "partner[image]"
    end
  end
end
