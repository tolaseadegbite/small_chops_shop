Rails.application.routes.draw do

  namespace :admin do
    get '/', to: '/admin/dashboard#index'
  end

  namespace :admin do
    resources :products
  end
  
  devise_for :users
  root 'static_pages#home'

  resources :products

  get '/shop', to: 'products#index', as: 'shop'
  get '/hire_me', to: 'static_pages#about', as: 'about'
end
