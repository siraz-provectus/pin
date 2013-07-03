PinClone::Application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  resources :users, only: [:edit, :update, :show] do
    member do
      get :subscriptions, :subscribers
    end
  end
  resources :pins, only: [:index, :new, :create] do
    get :load, on: :collection
    get :url_load, on: :collection
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  resources :friendships, only: [:destroy, :create] do
    get :load, on: :collection
  end

  match '/search',  to: 'search#search'

  root to: 'home#index'
end