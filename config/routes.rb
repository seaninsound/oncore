Oncore::Application.routes.draw do
  
resources :venues

root "venues#index"



end
