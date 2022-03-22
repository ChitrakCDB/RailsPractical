Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/users',to:"users#index"
  resources :products
  resources :authors
  resources :books
  resources :students
  resources :faculties
  #root 'products#index'
  root 'students#index'
end
