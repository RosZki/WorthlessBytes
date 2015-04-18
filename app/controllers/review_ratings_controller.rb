class ReviewRatingsController < ApplicationController
  def create
	if ReviewRating.where("game_review_id = ? AND user_id = ?", params[:review_id] ,session[:user_id]).length > 0
		redirect_to :back
	else
		@review_rating = ReviewRating.new(review_rating_params)
		@review_rating.game_review_id = params[:review_id]
		@review_rating.user_id = session[:user_id]
		@review_rating.save
		redirect_to :back
	end
  end

  def destroy
	@review_rating = Track.find(params[:id])
	@review_rating.destroy
	redirect_to :back
  end
  
  private
  def review_rating_params
	params.require(:review_rating).permit(:rating)
  end
end
