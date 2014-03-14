class OrderMailer < ActionMailer::Base
  default from: "seandis@gmail.com"

#I can call this method anything I want
#the order bit is us sending the order via email

  def new_order(order)
  	#lets make the order available in the view
  	@order = order 
  	@venue = @order.venue
  	@user = @venue.user

  	mail to: @user.email, subject: "You have a new order"

  end
end
