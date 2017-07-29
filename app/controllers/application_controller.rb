class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :address, :postcode, :local, :first_name, :last_name, :phone, :bio])
    devise_parameter_sanitizer.permit(:account_update , keys: [:username, :address, :postcode, :local, :first_name, :last_name, :phone, :bio])
  end
end