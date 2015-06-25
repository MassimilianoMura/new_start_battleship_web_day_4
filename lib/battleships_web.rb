require 'sinatra/base'
require 'battleships'
# THIS IS SERVER SIDE
class BattleshipsWeb < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/start' do
    # $game = Game.new Player, Board
    # @board = $game.own_board_view $game.player_1
    @visitor = params[:name]
    erb :start
  end

  get '/getboard_and_place_ships' do
    $game = Game.new Player, Board
    @board = $game.own_board_view $game.player_1
    @board2 = $game.own_board_view $game.player_2
    erb :getboard_and_place_ships
  end

  post '/getboard_and_place_ships' do

     ships_hash = {"cruiser" => Ship.cruiser,
                  "submarine"=> Ship.submarine,
                  "destroyer"=> Ship.destroyer,
                  "battleship"=> Ship.battleship,
                  "aircraft carrier"=> Ship.aircraft_carrier}

    ship = params[:ships]
    coordinates = (params[:x_coord].to_s + params[:y_coord].to_s).to_sym
    orientation = params[:orientation].to_sym

    $game.player_1.place_ship ships_hash[ship], coordinates, orientation

    @board = $game.own_board_view $game.player_1

    erb :getboard_and_place_ships
  end

  get '/battle' do

    @board = $game.own_board_view $game.player_1
    @board2 = $game.own_board_view $game.player_2

    erb :battle

  end

  post '/battle' do



    coordinates = (params[:x_coord].to_s + params[:y_coord].to_s).to_sym
    $game.player_2.shoot coordinates

    @board = $game.own_board_view $game.player_1
    @board2 = $game.own_board_view $game.player_2

    erb :battle

  end



  run! if app_file == $0
end
