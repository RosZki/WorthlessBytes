class GamesController < ApplicationController
  def index
	@game = Game.new
  end

  def new
	@game = Game.new
  end

  def create
	@game = Game.new(game_params)
	@game.save
	redirect_to '/admin'
  end

  def destroy
	@game = Game.find(params[:id])
	@game.destroy
	redirect_to '/admin'
  end
  
  private
  def game_params
	params.require(:game).permit(:name, :publisher, :developer, :platform, :year, :description, :genre, :gameposter)
  end
  
end
