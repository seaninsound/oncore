Oncore::Application.routes.draw do
  
resources :venues

#lets have a sign-up section

resources :users

#lets have a log in and log out section
#this is a singular resource, because as a user, we only ever logged in NOT multipule times

resource :session


root "venues#index"




end
