Rails.application.routes.draw do
  resources :users do
    resources :recipes
    resources :foods
  end
end
