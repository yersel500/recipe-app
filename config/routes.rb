Rails.application.routes.draw do
  devise_for :users

  root to: 'recipes#public_recipes'

  resources :users do
    resources :foods
    resources :recipes do
      resources :recipe_foods
    end
  end

  get '/users/:user_id/shopping', to: 'recipes#shopping_list', as: 'recipe_shopping'
  get '/public_list', to: 'recipes#public_recipes', as: 'public_recipes'
  delete '/users/:user_id/foods/:id/delete', to: 'utilities#delete_food', as: 'delete_food'
end
