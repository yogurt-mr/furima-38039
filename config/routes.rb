Rails.application.routes.draw do
  devise_for :users
  # get 'items/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "products#index"
  resources :users, only: :show
  resources :products, only: [:index, :new,:create,:show]
end
