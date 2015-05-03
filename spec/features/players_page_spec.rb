require 'rails_helper'

describe "Players page" do

  before(:each) do
    FactoryGirl.create(:user)
    FactoryGirl.create(:user2)
    visit root_path
    fill_in('username', with:'jooo')
    fill_in('password', with:'jooo')
    click_button('Kirjaudu')
  end

  it "successfully creates a new player" do

    visit jatkantappajat_path

    expect(page).not_to have_content('testi')
    expect(page).not_to have_content('1500.0')
    expect(page).not_to have_content('500.0')
    expect(page).not_to have_content('0.0')

    fill_in('player_name', with:'testi')
    click_button('Lisää pelaaja')

    expect(page).to have_content('testi')
    expect(page).to have_content('1500.0')
    expect(page).to have_content('500.0')
    expect(page).to have_content('0.0')
  end

  it "successfully creates a new player but doesn't show them when told not to" do

    visit jatkantappajat_path

    expect(page).not_to have_content('testi 1500.0')

    FactoryGirl.create(:user_player2)

    fill_in('player_name', with:'testi')
    check('player[private]')
    click_button('Lisää pelaaja')

    expect(page).not_to have_content('testi 1500.0')
  end

  it 'quick match add doesnt do anything if players not unique' do
    FactoryGirl.create(:player1)
    FactoryGirl.create(:player2)
    FactoryGirl.create(:player3)
    FactoryGirl.create(:player4)

    visit jatkantappajat_path

    expect(page).to have_content('player1 1500.0')
    expect(page).to have_content('player2 1500.0')
    expect(page).to have_content('player3 1500.0')
    expect(page).to have_content('player4 1500.0')

    select "player1", :from => "match[player1]"
    select "player2", :from => "match[player2]"
    select "player3", :from => "match[player3]"
    select "player1", :from => "match[player4]"

    click_button('Tallenna')

    expect(page).to have_content('player1 1500.0')
    expect(page).to have_content('player2 1500.0')
    expect(page).to have_content('player3 1500.0')
    expect(page).to have_content('player4 1500.0')
  end

  it 'changes ratings correctly when adding match result' do
    FactoryGirl.create(:player1)
    FactoryGirl.create(:player2)
    FactoryGirl.create(:player3)
    FactoryGirl.create(:player4)

    visit jatkantappajat_path

    expect(page).to have_content('player1 1500.0')
    expect(page).to have_content('player2 1500.0')
    expect(page).to have_content('player3 1500.0')
    expect(page).to have_content('player4 1500.0')

    select "player1", :from => "match[player1]"
    select "player2", :from => "match[player2]"
    select "player3", :from => "match[player3]"
    select "player4", :from => "match[player4]"

    click_button('Tallenna')

    expect(page).to have_content('player1 1677.33')
    expect(page).to have_content('player2 1677.33')
    expect(page).to have_content('player3 1322.67')
    expect(page).to have_content('player4 1322.67')
  end

end