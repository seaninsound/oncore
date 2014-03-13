Oncore::Application.routes.draw do
  
resources :venues

#lets have a sign-up section

resources :users



root "venues#index"




end
