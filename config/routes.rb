Rails.application.routes.draw do
  devise_for :users

  root to: 'recipes#public_recipes'

  resources :users do
    resources :foods
    resources :recipes do
      resources :recipe_foods
    end
  end

  
  get '/public_list', to: 'recipes#public_recipes', as: 'public_recipes'
  get '/users/:user_id/recipes/:recipe_id/shopping', to: 'recipes#shopping_list', as: 'recipe_shopping'
  delete '/users/:user_id/foods/:id/delete', to: 'utilities#delete_food', as: 'delete_food'
  get '/users/:user_id/recipes/:id/remove', to: 'utilities#remove_food', as: 'remove_food'
  patch '/users/:user_id/recipes/:id/toggle_public', to: 'utilities#toggle_public', as: 'make_public'
end
