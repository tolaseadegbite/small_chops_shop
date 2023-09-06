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

  
  resources :products do
    resources :reviews
    resources :wishlists, only: [:create, :destroy]
  end
  
  resources :categories
  
  get '/cart', to: 'cart#show'

  post 'cart/add'
  post 'cart/remove'

  get '/shop', to: 'products#index', as: 'shop'
  get '/hire_me', to: 'static_pages#about', as: 'about'
end
