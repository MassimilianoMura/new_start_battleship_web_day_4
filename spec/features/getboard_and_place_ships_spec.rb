require 'spec_helper'

feature "placing ships" do

  scenario 'place a ship on the board' do
    visit '/getboard_and_place_ships'
    select 'submarine', from: 'ships'
    select 'A', from: 'x_coord'
    select 1, from: 'y_coord'
    select 'horizontally', from: 'orientation'
    click_button('Place')
    expect(page).to have_content '1|S'
  end

end