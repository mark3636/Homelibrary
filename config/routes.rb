Rails.application.routes.draw do
  root to: "books#index"
  resources :borrowings
  resources :books
  resources :genres
  resources :publishing_houses
  resources :friends
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
