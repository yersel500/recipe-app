Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users do
    resources :foods
    resources :recipes do
      resources :recipe_foods
    end
  end

  get '/users/:user_id/shopping', to: 'recipes#shopping_list', as: 'recipe_shopping'
end
