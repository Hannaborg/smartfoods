class ShoppingList < ApplicationRecord
  belongs_to :food
  belongs_to :user

  validates :food, :user, presence: true
end
