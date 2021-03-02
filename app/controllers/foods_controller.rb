class FoodsController < ApplicationController
	def index
		@user = current_user
	    @selected_goals = @user.goals
	end
end
