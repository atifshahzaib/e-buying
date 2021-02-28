Rails.application.routes.draw do
  root 'products#index'
  resources :products
  resources :users
  resources :orders
  get '/sign_out' => 'users#logout'
  post '/checkout' => 'orders#checkout'
  
end
