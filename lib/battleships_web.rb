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
    erb :getboard_and_place_ships
  end

  post '/getboard_and_place_ships' do
    #ship = params[:ships]
    

    coordinates = (params[:x_coord].to_s + params[:y_coord].to_s).to_sym
    orientation = params[:orientation].to_sym

    $game.player_1.place_ship Ship.submarine, coordinates, orientation
    @board = $game.own_board_view $game.player_1

    erb :getboard_and_place_ships
  end







  run! if app_file == $0
end
