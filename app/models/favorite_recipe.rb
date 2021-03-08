class FavoriteRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :recipe, :user, presence: true
end
