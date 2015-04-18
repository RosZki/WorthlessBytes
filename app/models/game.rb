class Game < ActiveRecord::Base

has_many :game_reviews
has_many :screenshots
mount_uploader :gameposter, PictureUploader

def get_number_reviews
	game_reviews.length
end

def get_average_rating
	total = 0;
	pos = 0;
	game_reviews.each do |review|
		if review.rating
			pos = pos + 1
		end
		total = total + 1
	end
	if total == 0
		0
	else
		pos*100/total
	end
end

end
