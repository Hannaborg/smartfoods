class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_goals
  has_many :goals, through: :user_goals
  has_many :shopping_lists
  has_many :foods, through: :shopping_lists
  has_many :favorite_recipes
  has_many :recipes, through: :favorite_recipes

  validates :email, uniqueness: true, presence: true
end
