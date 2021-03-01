class UserGoal < ApplicationRecord
  belongs_to :user
  has_many :goals
end
