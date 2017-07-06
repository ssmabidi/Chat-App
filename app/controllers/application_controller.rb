class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) << :name
    # devise_parameter_sanitizer.for(:account_update) << :name
    # For Devise 4 and Rails 5 employ:
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :user_type])
	end
end
