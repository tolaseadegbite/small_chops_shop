Rails.application.routes.draw do
  
  namespace :admin do
    get '/', to: '/admin/dashboard#index'
  end
  
  namespace :admin do
    resources :products
    resources :users
    resources :banners
    resources :categories
  end
  
  devise_for :users
  root 'static_pages#home'
  
  resources :products

  resources :categories
  
  get '/shop', to: 'products#index', as: 'shop'
  get '/hire_me', to: 'static_pages#about', as: 'about'
end
