require 'sinatra/base'
require 'battleships'

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

  # get '/getboard_and_place_ships' do
    



    

  run! if app_file == $0
end
