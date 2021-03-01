class FavoriteRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe, dependent: :destroy
end
