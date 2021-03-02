class FavoriteRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe, dependent: :destroy

  validates :recipe, :user, presence: true
end
