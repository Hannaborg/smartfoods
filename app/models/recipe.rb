class Recipe < ApplicationRecord
  has_many :foods, through: :RecipeFood
  has_many :users, through: :FavoriteRecipe
end
