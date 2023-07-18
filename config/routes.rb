Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'services/index'
  root 'home#index'

  get 'products', to: 'products#index'
  get 'products/:id', to: 'products#show', as: 'product'

  get 'testimonials', to: 'testimonials#index'

  get 'contact', to: 'contact#index'
  post 'contact', to: 'contact#create'
  get 'categories', to: 'categories#index'

  get 'signin', to: 'users#new'
  post 'signin', to: 'users#create'

  get 'cart', to: 'cart#index'
  patch 'cart/:id', to: 'cart#update', as: 'update_cart'
  delete 'cart/:id', to: 'cart#destroy', as: 'delete_cart'

  get 'about', to: 'about#index'

  get 'support', to: 'support#index'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'application#destroy', as: 'logout'


  namespace :admin do
    resources :admins, only: [:index, :new, :create]
    resources :users, only: [:index, :new, :create]
    resources :products, only: [:index, :new, :create]
  end
end
