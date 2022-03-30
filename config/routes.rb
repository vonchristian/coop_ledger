Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"

  namespace :accounting do
    resources :accounts, only: [:index]
  end
end
