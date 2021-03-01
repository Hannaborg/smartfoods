class GoalFood < ApplicationRecord
  belongs_to :goal
  has_many :foods
end
