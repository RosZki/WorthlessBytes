class SessionsController < ApplicationController

def register_page
end

def register
	user = User.create_user(params[:username], params[:password], params[:password_confirm], params[:country])
	if user
		redirect_to :root
		return
	else
		redirect_to action: :register_page
		return
	end
end

def login
	user = User.authenticate(params[:username], params[:password])
	if user
		session[:user_id] = user.id
		session[:user_name] = user.username
		if user.username == "admin"
			redirect_to '/admin'
			return
		else
			redirect_to :root
			return
		end
	end
end

def logout
	session[:user_id] = nil
	session[:user_name] = nil
	redirect_to :root
end	
	

end
