Oncore::Application.routes.draw do

#to add a page i.e. about page 
#{}"about" => "contents#about"

get "auth/:provider/callback" => "social_logins#create"

  
resources :venues do
	#because I'm placing orders onto venues
	#this is a nested resource
	resources :orders, only: [:new, :create]
end

#another section to the site that is the list and single order page
#allows you to see your orders without seeing the venue page

resources :orders, only: [:index, :show]

#lets have a sign-up section

resources :users

#lets have a log in and log out section
#this is a singular resource, because as a user, we only ever logged in NOT multipule times

resource :session


root "venues#index"




end
