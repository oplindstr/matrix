require 'rails_helper'

describe "Matches page" do

  before(:each) do
    FactoryGirl.create(:user)
    FactoryGirl.create(:user2)
    visit root_path
    fill_in('username', with:'jooo')
    fill_in('password', with:'jooo')
    click_button('Kirjaudu')
    FactoryGirl.create(:player1)
    FactoryGirl.create(:player2)
    FactoryGirl.create(:player3)
    FactoryGirl.create(:player4)
  end

  it 'when adding a match and immediately saving, doesnt affect ratings' do
    visit jatkantappajat_path

    click_button('Uusi peli')

    select "player1", :from => "match[player1]"
    select "player2", :from => "match[player2]"
    select "player3", :from => "match[player3]"
    select "player4", :from => "match[player4]"

    click_button('Aloita peli')

    click_button('Tallenna peli')

    expect(page).to have_content('player1 1500.0')
    expect(page).to have_content('player2 1500.0')
    expect(page).to have_content('player3 1500.0')
    expect(page).to have_content('player4 1500.0')
  end

end