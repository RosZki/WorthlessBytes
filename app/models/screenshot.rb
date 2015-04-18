class Screenshot < ActiveRecord::Base

belongs_to :game
mount_uploader :picture, PictureUploader

end
