Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :recipes
    resources :foods
  end

  root to: "users#index"
end
