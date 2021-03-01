class Food < ApplicationRecord
  has_many :shopping_lists
  has_many :users, through: :shopping_lists
  has_many :goal_foods
  has_many :goals, through: :goal_foods
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods
end
