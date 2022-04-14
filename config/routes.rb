Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  draw(:teller_routes)
  namespace :accounting do
    resources :accounts, only: [:index]
  end

  namespace :members do
    resources :accounts, only: [:index, :show]

    namespace :onboarding do
      resources :personal_details, only: [:new, :create]
    end
  end
end
