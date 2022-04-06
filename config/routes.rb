Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root 'employees#index'
  post '/increaseOrder', to: "employees#increaseOrder"
  post '/decreaseOrder', to: "employees#decreaseOrder"
  get '/users',to:"users#index"
  get 'employees/queries'
  get 'orders/root'
  get 'myproducts/defaultscopeview'
  resources :products
  resources :myproducts
  resources :authors
  resources :orders
  resources :customers
  resources :books
  resources :students
  resources :faculties
  resources :employees

  
  root 'myproducts#index'
  #root 'students#index'

end
