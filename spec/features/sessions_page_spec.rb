require 'rails_helper'

describe "Sessions page" do
  it "log in succeeds when user exists" do
    FactoryGirl.create(:user)
    visit signin_path
    fill_in('username', with:'joo')
    fill_in('password', with:'joo')
    click_button('Kirjaudu')

    expect(page).to have_content 'joo signed in'
    expect(page).to have_content 'Welcome joo!'
    expect(page).to have_content 'Kirjaudu ulos'
  end

end