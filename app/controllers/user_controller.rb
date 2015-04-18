class UserController < ApplicationController
  def index
  end

  def new
  end

  def create
  end
  
  def update
	user = User.find(params[:id])
	user.update_attributes(update_params)
	redirect_to :back
  end
	
private
def update_params
	params.require(:user).permit(:aboutme, :profilepicture)
end

	
end
