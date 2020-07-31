Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

  get "/dashboard", to: "dashboard#show", as: "dashboard"

  resources :leagues
  resources :seasons, except: [:index]
  resources :picks, only: [:create, :destroy]

  namespace :admin do
    get "/winners", to: "winners#index", as: "winners"
    post "/winners", to: "winners#create"
  end
end
