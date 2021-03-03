Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :foods, only: %i[ index ] do
    resources :recipes, only: %i[ index show ] do

  end
end
resources :recipes, only: %i[] do
  resources :favorite_recipes, only: %i[ create ]
end
  resources :favorite_recipes, only: %i[ index destroy ]
  resources :shopping_lists, only: %i[ index create destroy ]
  resources :user_goals, only: %i[ index create new ]
  resources :user_views, only: %i[ index ]
end
