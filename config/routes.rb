Rails.application.routes.draw do
  resources :products do
    resources :orders, only: [:index, :create]
  end
  resources :products
  devise_for :users
  root to: "products#index"
end
