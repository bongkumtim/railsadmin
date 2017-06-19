Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  root 'lists#index'
  resources :lists
  
  get '/index' => 'lists#index'
end
