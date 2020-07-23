Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

  get "/dashboard", to: "dashboard#show", as: "dashboard"

  resources :leagues
  resources :seasons, except: [:index]
end
