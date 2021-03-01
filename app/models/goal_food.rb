class GoalFood < ApplicationRecord
  belongs_to :goal
  belongs_to :food
end
