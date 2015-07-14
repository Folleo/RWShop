Rails.application.routes.draw do

  root 'products#index'

  get '/fetch_products' => 'products#from_category', as: 'fetch_products'
  get 'payments/new' => 'payments#new', :as => 'new_payment'
  get '/admin' => 'admin#index'
  get '/admin/categories' => 'admin#categories', :as => 'admin_categories'
  get '/admin/products' => 'admin#products', :as => 'admin_products'
  get '/admin/users' => 'admin#users', :as => 'admin_users'
  get '/admin/change_user_state' => 'admin#change_user_state', :as => 'change_user_state'
  get '/product_row/:id' => 'products#show_row', :as => 'product_row'
  get '/category_row/:id' => 'categories#show_row', :as => 'category_row'
  get '/category/:id/bind_products' => 'categories#bind_products', :as => 'bind_products'

  resources :categories
  resources :products
  resources :payments, only: [:new, :create]
  resources :admin

  resource :cart, only: [:show]  do
    get '/cart' => 'carts#show', as: 'cart'
  end

  resources :order_items, only: [:create, :update, :destroy]

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

end
