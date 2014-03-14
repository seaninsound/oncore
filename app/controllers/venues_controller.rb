class VenuesController < ApplicationController

#I want to make sure that we're logged in on new,create, edit, update and destroy
before_action :make_sure_logged_in, 
				only: [:new, :create, :edit, :update, :destroy]

	def index
		#show a list of all venues 
		@venues = Venue.all 
	end

	def show
		#venue page
		@venue = Venue.find(params[:id])
	end

	def new
		#add a venue
		#@venue = Venue.new
		@venue = current_user.venues.new

	end

	def create
		#enter a venue into the database
		#@venue = Venue.new(venue_params)
		
		@venue = current_user.venues.new(venue_params)
		

		if @venue.save
			flash[:success] = "Thank you. Your venue has been added." 
			redirect_to venue_path(@venue)
		else 
			render "new"
		end

	end

	def edit
		#@venue = Venue.find(params[:id])
		@venue = current_user.venues.find(params[:id])
		
	end

	def update
		#@venue = Venue.find(params[:id])
		@venue = current_user.venues.find(params[:id])

		if @venue.update(venue_params)
			flash[:success] = "Your venue has been updated"
			redirect_to venue_path(@venue)
		else
			render "edit"

		end
	end

	def destroy
		#@venue = Venue.find(params[:id])
		@venue = current_user.venues.find(params[:id])
		@venue.destroy
		flash[:success] = "Your venue has been destroyed!"
		redirect_to root_path
	end


	def venue_params
		#this whitelists our form data
		params.require(:venue).permit(:name, :address, :capacity, :price_in_pence, :is_available, :image)
	end
end
