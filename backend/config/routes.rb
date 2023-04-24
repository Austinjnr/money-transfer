Rails.application.routes.draw do
  resources :wallets do
    member do
      post 'top_up'
      post 'send_money'
    end
  end
  resources :users, only: [:index]
  resources :transactions
  resources :beneficiaries
  resources :accounts , only:[:index, :create, :update , :destroy , :show] , param: :id 
  # Routes for users
  post '/accounts/:user_id' , to: "accounts#create"
  post '/login', to: "users#authenticate"
  delete '/logout', to: "users#destroy"
  post '/register' , to: "users#create"
  get  'users' , to: "users#index"
end
