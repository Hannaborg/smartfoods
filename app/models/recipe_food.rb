class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :food, :recipe, presence: true
end
