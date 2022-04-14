namespace :tellers do

  namespace :savings do
    resources :accounts, only: [:index]
    resources :account_openings, only: [:new, :create] do
      resources :previews, only: [:show]
      resources :confirmations, only: [:create]
    end
  end

end