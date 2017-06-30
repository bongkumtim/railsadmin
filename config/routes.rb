Rails.application.routes.draw do
  
  resources :accounts
  devise_for :users

  authenticated :user do
  	root 'lists#index', as: "authenticated_root"
  end

  root 'lists#welcome'

  resources :lists do
  	resources :reviews, except: [:show, :index]
  end
  
  get '/index' => 'lists#index'
  get '/welcome' => 'lists#welcome'
  get '/opening_cash' => 'accounts#opening_cash'
  get '/opening_bank' => 'accounts#opening_bank'
  get '/cash_purchase' => 'accounts#cash_purchase'
  get '/credit_purchase' => 'accounts#credit_purchase'
  get '/cash_collection' => 'accounts#cash_collection'
  get '/payment_cash' => 'accounts#payment_cash'
  get '/payment_bank' => 'accounts#payment_bank'
  get '/card_collection' => 'accounts#card_collection'
  get '/fpx_collection' => 'accounts#fpx_collection'
  get '/bank_transfer' => 'accounts#bank_transfer'
  get '/cash_ca' => 'accounts#cash_ca'
  get '/purchase_cos' => 'accounts#cos'
  get '/trade_creditor' => 'accounts#trade_creditor'



end
