class UsersController < ApplicationController

	#this controller is for signing up new users

	def new
			#sign up form
			@user = User.new

	end

	def create
			#sign up
			@user = User.new(user_params)

			if @user.save
				flash[:success] = "Welcome! You have successfully signed up."

				#sessions track users
				#this is the user of the site, let them store which ID they are once signed up
				session[:uid] = @user.id 

				redirect_to root_path
			else
				render "new"
			end
	end

	def user_params
			#whitelist the form data
			params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)

	end
end
