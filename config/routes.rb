Rails.application.routes.draw do
  get 'support/index'
  get 'about/index'
  get 'cart/index'
  get 'cart/update'
  get 'cart/destroy'
  get 'login/new'
  get 'login/create'
  get 'contact/index'
  get 'contact/create'
  get 'testimonials/index'
  get 'products/index'
  get 'products/show'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
