class SessionsController < ApplicationController

	#this logs in and out

	def new
		#login form

	end

	def create
		#actually log in
		#find user with username submitted if there is one AND password match
		#signed them in and give them a session
		#if not, show the form again

		#the simple_form has a :session and inside that a :username and :password
		@username = params[:session][:username]
		@password = params[:session][:password]

		@user = User.find_by_username(@username)
		if @user.nil?
			@user = User.find_by_email(@username)
		end


		if @user.present? and @user.authenticate(@password)
			#we are the right user
			flash[:success] = "You are now logged in"
			session[:uid] = @user.id
			redirect_to root_path
		else
			#login is wrong
			flash[:error] = "Your details are incorrect"
			render "new"
			
		end


	end

	def destroy
		#log out
		#remove the session from the user
		reset_session
		flash[:success] = "You are now logged out!"
		redirect_to root_path
	end

end
