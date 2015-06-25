require 'spec_helper'

feature 'start battle' do

    # skipped test, fix it!

  skip 'hit a ship on the board' do
    visit '/getboard_and_place_ships'
    select 'submarine', from: 'ships'
    select 'A', from: 'x_coord'
    select 1, from: 'y_coord'
    select 'horizontally', from: 'orientation'
    click_button('Place')

    visit '/battle'
    select 'A', from: 'x_coord'
    select 1, from: 'y_coord'
    click_button('Shoot')
    expect(page).to have_content 'battle'
  end

end
