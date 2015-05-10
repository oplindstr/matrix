require 'rails_helper'

describe "Event page" do

  before(:each) do
    FactoryGirl.create(:user)
    visit root_path
    fill_in('username', with:'joo')
    fill_in('password', with:'joo')
    click_button('Kirjaudu')
    FactoryGirl.create(:event2)
    FactoryGirl.create(:event3)
    FactoryGirl.create(:event4)

  end

  it "is possible to sign up and cancel when current time is between signup start and end and before signup cancellable until" do
    visit event_path(1)
    expect(page).to have_content("tapahtuma")
    expect(page).to have_content("Tapahtumaan ei ole vielä ilmoittautunut ketään")

    click_button("Ilmoittaudun")

    expect(page).to have_button("Peru ilmoittautuminen")

    click_button("Peru ilmoittautuminen")

    expect(page).to have_content("Tapahtumaan ei ole vielä ilmoittautunut ketään")
  end

  it "is not possible to sign up when current time is not between signup start and end" do
    visit event_path(2)
    expect(page).not_to have_button("Ilmoittaudun")
  end

  it "is not possible to cancel sign up when current time is after signup cancellable until" do
    visit event_path(3)

    expect(page).to have_content("Tapahtumaan ei ole vielä ilmoittautunut ketään")

    click_button("Ilmoittaudun")

    expect(page).not_to have_content("Tapahtumaan ei ole vielä ilmoittautunut ketään")

    expect(page).not_to have_button("Peru ilmoittautuminen")
  end

end
