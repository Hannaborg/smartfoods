class Recipe < ApplicationRecord
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods
  has_many :favorite_recipes
  has_many :users, through: :favorite_recipes

  validates :title, :description, presence: true
end
