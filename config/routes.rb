Rails.application.routes.draw do
  devise_for :users

  root to: 'recipes#index'

  resources :users do
    resources :foods
    resources :recipes do
      resources :recipe_foods
    end
  end
end
