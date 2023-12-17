Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "products#index", as: :authenticated_root
  end

  root 'static_pages#home'
  
  namespace :admin do
    resources :products
    resources :users
    resources :banners
    resources :categories
    resources :user_products, controller: 'orders'
    get '/', to: '/admin/dashboard#index'
    get '/orders', to: 'orders#index'
  end

  post '/webhooks/:source', to: 'webhooks#create'

  post "checkout/create", to: 'checkout#create'
  
  resources :products do
    resources :reviews
    resources :wishlists, only: [:create, :destroy]
  end
  get '/orders', to: 'products#purchased_products', as: 'orders'

  get '/my_wishlists', to: 'wishlists#index', as: 'my_wishlists'
  
  resources :categories

  get '/cart', to: 'cart#show'

  post 'cart/add'
  post 'cart/remove'

  get '/shop', to: 'products#index', as: 'shop'
  get '/about', to: 'static_pages#about', as: 'about'
  get '/contact', to: 'static_pages#contact', as: 'contact'
  get '/home', to: 'static_pages#home', as: 'home'

  get '/success', to: "checkout#success", as: "checkout_success"
  get '/failure', to: "checkout#failure", as: "checkout_failure"

  
end
