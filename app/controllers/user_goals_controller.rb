class UserGoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
    @user = current_user
    @goal = Goal.new
  end

  def create
    @goal = Goal.new
    @goal.user = current_user
    if @goal.save
      redirect_to goal_path(@goal)
    else
      render :new
    end
  end

end
