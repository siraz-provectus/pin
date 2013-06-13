PinClone::Application.routes.draw do
  devise_for :users
  
  resources :users, only: [:edit, :update, :show]
  resources :pins, only: [:index, :new, :create]
  resources :friendships, only: [:destroy, :create]

   root to: 'home#index'
   match '/search',  to: 'search#search'

end
