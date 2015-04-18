class GameReview < ActiveRecord::Base

belongs_to :game
belongs_to :user

has_many :review_ratings

def get_username
	user.username
end

def get_user_profilepicture
	user.profilepicture
end

def get_gamename
	game.name
end

def get_positive_ratings
	total = 0;
	review_ratings.each do |rating|
		if rating.rating
			total = total + 1
		end
	end
	total
end

def get_negative_ratings
	total = 0;
	review_ratings.each do |rating|
		if !rating.rating
			total = total + 1
		end
	end
	total
end

end
