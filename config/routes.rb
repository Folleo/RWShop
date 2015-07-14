Rails.application.routes.draw do

  # You can have the root of your site routed with "root"
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

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
