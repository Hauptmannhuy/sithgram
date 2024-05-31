Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: [:index,:show,:edit,:update]
  get "friends/list", to: "friends#list"
  resource :friends, only: [:destroy,:show] do 
    resources :requests, only: [:index, :create,:destroy] 
  end
  resources :friendships, only: [:create,:destroy]
  resources :posts do 
    resources :comments, only: [:create,:destroy]
  end
  # resources :likes, only: [:destroy, :create]
  
  post 'likes/add'
  post 'likes/remove'
  root "users#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
