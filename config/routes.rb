Rails.application.routes.draw do
  devise_for :users

  root to: "recipes#index"

  resources :users do
    resources :recipes
    resources :foods
  end
end
