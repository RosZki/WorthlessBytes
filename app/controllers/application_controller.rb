class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def home
  end
  
  def game_list
	@games = Game.all
  end
  
  def search
	results = Game.all
	results = results.where('name LIKE ?', "%#{params[:name]}%")
	results = results.where('platform REGEXP ?', params[:platform].join('|'))
	results = results.where('genre REGEXP ?', params[:genre].join('|'))
	finalResults = []
	results.each do |game|
		if params[:RatingFrom].to_i <= game.get_average_rating && game.get_average_rating <= params[:RatingTo].to_i
			finalResults.push(game)
		end
	end
	@games = finalResults
	render 'game_list'
  end
  
  def game
	@game = Game.find(params[:id])
	@game_review = GameReview.new
	@review_rating = ReviewRating.new
  end
  
  def profile
	@user = User.find(session[:user_id])
  end
  
  def visit_profile
	@user = User.find(params[:user_id])
	@review_rating = ReviewRating.new
	render 'profile'
  end
  
  def admin
	if(session[:user_id] != nil)
		user = User.find(session[:user_id])
		if user.username != "admin"
			redirect_to :root
		else
			@game = Game.new
		end
	else
		redirect_to :root
	end
  end
  
end
