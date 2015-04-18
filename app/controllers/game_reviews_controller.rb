class GameReviewsController < ApplicationController
  def create
	if GameReview.where("game_id = ? AND user_id = ?", params[:game_id] ,session[:user_id]).length > 0
		redirect_to :back
	else
		@game_review = GameReview.new(game_review_params)
		@game_review.game_id = params[:game_id]
		@game_review.user_id = session[:user_id]
		@game_review.save
		redirect_to :back
	end
  end

  def destroy
	@game_review = Track.find(params[:id])
	@game_review.destroy
	redirect_to :back
  end
  
  private
  def game_review_params
	params.require(:game_review).permit(:summary, :review, :rating)
  end
  
end
