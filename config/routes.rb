Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "restaurants#index"
  post  "status", to: "restaurants#restaurant_status"
  get "restaurants/review"
  resources :restaurants do
    resources :reviews
  end
  resources :dishes do
    resources :reviews
  end
  resource :users
  resources :admins
  resources :orders
end
