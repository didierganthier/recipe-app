Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'

  resources :recipes, except: [:edit, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  resources :foods, except: [:edit, :update]

  get '/general_shopping_list', to: 'foods#general'
  get '/public_recipes', to: 'recipes#public'
end