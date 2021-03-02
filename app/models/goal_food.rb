class GoalFood < ApplicationRecord
  belongs_to :goal
  belongs_to :food

  validates :goal, :food, presence: true
end
