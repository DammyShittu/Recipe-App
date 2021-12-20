class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery prepend: true 
  before_action :update_allowed_parameters, if: :devise_controller? 
  protected 
  def update_allowed_parameters 
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
  end 
end
