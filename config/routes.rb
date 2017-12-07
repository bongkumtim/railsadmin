Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :accounts
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  authenticated :user do
  	root 'lists#index', as: "authenticated_root"
  end

  root 'lists#welcome'

  resources :lists do
  	resources :reviews, except: [:show, :index]
  end

  resources :offers

  resources :income_taxes

  
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
  get '/generate' => 'accounts#generate'
  get '/recurring_payment_cash' => 'accounts#recurring_payment_cash'
  get '/recurring_payment_bank' => 'accounts#recurring_payment_bank'
  get '/asset_purchase_cash' => 'accounts#asset_purchase_cash'
  get '/asset_purchase_bank' => 'accounts#asset_purchase_bank'
  get '/asset_purchase_loan' => 'accounts#asset_purchase_loan'
  get '/showing' => 'lists#showing'
  get '/closing' => 'accounts#closing'
  get '/tutorial' => 'lists#tutorial'
  get 'income' => 'income_taxes#incometax'
end
