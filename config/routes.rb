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
    root to: 'dashboard#index'
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
    get 'admins/new', to: 'admins#new', as: 'new_admin'
    post 'admins', to: 'admins#create', as: 'create_admin'
    resources :admins, except: [:show]
    get 'admins/:id', to: 'admins#show', as: 'admin_show_admin'

    get 'dashboard/users', to: 'dashboard#users', as: 'users'
    get 'dashboard/products/new', to: 'dashboard#new_product', as: 'new_product'
    get 'dashboard/users/:id', to: 'dashboard#show_user', as: 'show_user'
    resources :categories, except: [:show]
    resources :products, except: [:new]  # Remove the duplicated line
  end




end
