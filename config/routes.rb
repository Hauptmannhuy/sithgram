Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/destroy'
  get 'posts/edit'
  get 'friendship/create'
  get 'friendship/destroy'
  get 'requests/index'
  get 'requests/create'
  get 'requests/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
    resources :users, only: [:index,:show]
    get "friends/list", to: "friends#list"
    resource :friends, only: [:destroy,:show] do 
     resources :requests, only: [:index, :create,:destroy] 
    end
    resources :friendships, only: [:create,:destroy]
    resources :posts

  root "users#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
