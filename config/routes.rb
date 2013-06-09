PinClone::Application.routes.draw do

  devise_for :users
  resources :users, only: [:edit, :update]
  resources :pins, only: [:index, :new, :create]

   root to: 'home#index'

end
