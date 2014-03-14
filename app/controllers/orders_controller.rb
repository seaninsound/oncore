class OrdersController < ApplicationController

	#first thing make sure we're logged in

	before_action :make_sure_logged_in 


	def new
		#booking form
		#I need to find the venue that we're making a booking on
		@venue = Venue.find(params[:venue_id])
		#because venue "has_many :orders"
		@order = @venue.orders.new 
		#which person is booking the venue
		@order.user = current_user

	end

	def create
		#actually booking
		@venue = Venue.find(params[:venue_id])
		@order = @venue.orders.new(order_params) 
		@order.user = current_user

		if @order.save
			#charge the user who booked
			Stripe::Charge.create(
				amount: @venue.price_in_pence, 
				currency: "gbp",
				card: @order.stripe_token, 
				description: "Order number #{@order.id}"
				)


			flash[:success] = "Your venue is now booked"
			redirect_to root_path(@venue)
		else
			flash[:error] = "Payment unsuccessful"
			render "new"
		end

	end


	def order_params
		params.require(:order).permit(:stripe_token)
	end


end
