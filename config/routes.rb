Rails.application.routes.draw do
  resources :widgets
  resources :admin
  resources :items do
    resources :lineitems
  end 
  resources :carts do
    resources :lineitems
  end 
  resources :orders do
    resources :lineitems
  end
  resources :lineitems
  resources :users
  resources :access
  resources :shopper
    
  resources :aboutus
  resources :contact
  resources :questions
  
  get    '/login',   to: 'access#new'
  post   '/login',   to: 'access#create'
  delete '/logout',  to: 'access#destroy'

  #resources :shopper
  root 'shopper#index'
end
