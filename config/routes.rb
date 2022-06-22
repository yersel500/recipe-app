Rails.application.routes.draw do
  devise_for :users

  root to: "recipes#public_recipes"

  resources :users do
    resources :foods
    resources :recipes do
      resources :recipe_foods
    end
  end

  get "/public_list",  to: "recipes#public_recipes", as: "public_recipes"
end
