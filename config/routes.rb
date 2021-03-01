Rails.application.routes.draw do
  get 'favorite_recipes/create'
  get 'favorite_recipes/index'
  get 'favorite_recipes/destroy'
  get 'recipes/index'
  get 'recipes/show'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
