Rails.application.routes.draw do
  
  devise_for :users

  root 'lists#index'

  resources :lists do
  	resources :reviews, except: [:show, :index]
  end
  
  get '/index' => 'lists#index'
end
