# require "chef_sanitizer"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  # def configure_permitted_parameters
  #   if resource_class == Chef
  #     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :restaurant_name, :address, :city, :state, :zip, :phone_number, :description, :password, :password_confirmation)}
  #   end
  # end

  def after_sign_in_path_for(resource)
    # flash[:success] = "Great Success!"
    posts_path
  end

end
