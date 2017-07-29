Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"
  
  resources :comments
  resources :products
  resources :categories
  resources :stores
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'products#my_products'
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  get 'static/home' => 'static#home'
  get 'my_cart' => 'carts#my_cart'
  get 'my_list' => 'carts#my_list'
  get 'my_products' => 'products#my_products'
  get 'remove_list' => 'carts#remove_list'
  post 'remove_list' => 'carts#remove_list'
  get 'generate_list' => 'carts#generate_list'
  post 'generate_list' => 'carts#generate_list'
  patch 'generate_list' => 'carts#generate_list'
  get 'trash_list_item' => 'carts#trash_list_item'
  get 'update_cart' => 'carts#update_cart'
  post 'update_cart' => 'carts#update_cart'
  patch 'update_cart' => 'carts#update_cart'
  get 'delete_product' => 'carts#delete_product'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
