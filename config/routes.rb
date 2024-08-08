Rails.application.routes.draw do

  get "login"=> "users#login_form"
  post "login"=> "users#login"
  get "logout"=> "users#logout"

  post "users/:id/update" => "users#update"
  post "users/create" => "users#create"
  get "signup"=> "users#new" 
  get 'users/index'=> "users#index"
  get "users/:id"=> "users#show" 
  get "users/:id/edit" =>"users#edit"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  
  get  "posts/:id/destroy" => "posts#destroy"
  
  get "/" => "home#top"
  get "about" => "home#about"
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  
  resources :users
  resource :session, only: [:new, :create, :destroy]
  
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
  root 'posts#index'

  resources :likes, only: [:index]
end
