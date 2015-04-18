class User < ActiveRecord::Base

has_many :game_reviews
has_many :review_ratings
mount_uploader :profilepicture, PictureUploader

def self.create_user(username, password, password_confirm, country)
	return false if password != password_confirm
	return false if User.where(username: username).to_a.size > 0

	salt = BCrypt::Engine.generate_salt
	hashed_password = BCrypt::Engine.hash_secret(password, salt)
	new_user = User.create(username: username, password: hashed_password, salt: salt, country: country)
	new_user
end

def self.authenticate(username, password)
	user = User.where(username: username).first
	if user.present? && user.password == BCrypt::Engine.hash_secret(password, user.salt)
		user
	else
		nil
	end
end

def get_number_of_reviews
	GameReview.where(user_id: id).count
end

def get_average_rating
	total = 0;
	pos = 0;
	game_reviews.each do |review|
		review.review_ratings.each do |rating|
			if rating.rating
				pos = pos + 1
			end
			total = total + 1
		end
	end
	if total == 0
		0
	else
		pos*100/total
	end
end

end
