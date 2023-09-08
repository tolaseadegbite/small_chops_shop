Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  
  namespace :admin do
    get '/', to: '/admin/dashboard#index'
  end
  
  namespace :admin do
    resources :products
    resources :users
    resources :banners
    resources :categories
  end

  post "checkout/create", to: 'checkout#create'
  
  resources :products do
    resources :reviews
    resources :wishlists, only: [:create, :destroy]
  end

  get '/my_wishlists', to: 'wishlists#index', as: 'my_wishlists'
  
  resources :categories

  get '/cart', to: 'cart#show'

  post '/webhooks/:source', to: 'webhooks#create'

  post 'cart/add'
  post 'cart/remove'

  get '/shop', to: 'products#index', as: 'shop'
  get '/hire_me', to: 'static_pages#about', as: 'about'

  get '/success', to: "checkout#success", as: "checkout_success"
  get '/failure', to: "checkout#failure", as: "checkout_failure"
end
