Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

  get "/dashboard", to: "dashboard#show", as: "dashboard"

  resources :leagues
  resources :seasons, except: [:index] do
    member do
      get "standings", to: "standings#show"
    end
  end

  resources :picks, only: [:index, :create, :destroy]

  namespace :admin do
    get "/winners", to: "winners#index"
    post "/winners", to: "winners#create"
  end

  get "/unsubscribe", to: "unsubscribe#reminders"
end
