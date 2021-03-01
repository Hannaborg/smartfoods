class Goal < ApplicationRecord
  has_many :user_goals
  has_many :users, through: :user_goals
  has_many :goal_foods
  has_many :foods, through: :goal_foods
end
