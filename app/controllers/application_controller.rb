class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:full_name, :email, :password, :password_confirmation, :username, :address,
     :tel, :profile_image]

    devise_parameter_sanitizer.for(:account_update) do |u| 
      u.permit registration_params << :current_password
    end

    devise_parameter_sanitizer.for(:sign_up) do |u| 
      u.permit(registration_params) 
    end
  end
end
