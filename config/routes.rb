Rails.application.routes.draw do
  get "flights/index"
  get "flights/search", to: "flights#search", as: "search"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  root "flights#index"
end
