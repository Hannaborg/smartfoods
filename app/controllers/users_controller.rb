class UsersController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    def profile
        @user = current_user
    end
end