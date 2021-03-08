class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :first_name, :last_name) }
    end

    def current_shopping_list
      @shopping_list ||= ShoppingList.where(user: current_user.id)
    end
    helper_method :current_shopping_list
end
