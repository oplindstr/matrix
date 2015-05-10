require 'rails_helper'

describe "Events page" do

  before(:each) do
    FactoryGirl.create(:user)
    visit root_path
    fill_in('username', with:'joo')
    fill_in('password', with:'joo')
    click_button('Kirjaudu')
    FactoryGirl.create(:event)

  end

  it "doesn't show past events as upcoming" do
    visit events_path
    expect(page).to have_content("Ei tulevia tapahtumia")
    expect(page).not_to have_content("paras")
  end

  it "shows past events in all events", :js => true do
    visit events_path

    select "Kaikki tapahtumat", :from => "EventSelect"

    expect(page).to have_content("paras")
  end
end