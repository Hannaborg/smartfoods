class UserGoalsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @goals = Goal.all
  end

  def new
    @user = current_user
    @goals = Goal.all
    @user_goals = UserGoal.new
  end

  def create
    @goals = Goal.all
    current_user.user_goals.destroy_all
    params["array"].each do |key, value|
      UserGoal.create(goal: @goals[key.to_i], user: current_user)
    end
      redirect_to foods_path
  end

end
