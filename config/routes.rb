Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'

  resources :products

  get '/shop', to: 'products#index', as: 'shop'
  get '/hire_me', to: 'static_pages#about', as: 'about'
end
