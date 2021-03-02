Rails.application.routes.draw do
  root 'products#index'
  resources :products
  resources :users
  resources :orders
  get '/sign_out' => 'users#logout'
  get 'login', to: 'sessions#new'
  post '/checkout' => 'orders#checkout'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  delete 'remove_product_from_cart' => 'orders#remove_product_from_cart'
end
