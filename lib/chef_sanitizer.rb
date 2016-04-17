# class Chef::ParameterSanitizer < Devise::ParameterSanitizer
#   # def initialize(*)
#   #   super
#   #   permit(:sign_up, keys: [:first_name, :last_name, :email, :restaurant_name, :address, :city, :state, :zip, :phone_number, :description, :password, :password_confirmation])
#   # end
#   binding.pry
#   def initialize(*)
#     super
#     permit(:sign_up) do |params|
#       binding.pry
#       params.permit(:first_name, :last_name, :email, :restaurant_name, :address, :city, :state, :zip, :phone_number, :description, :password, :password_confirmation)
#     end
#
#     permit(:account_update) do |params|
#       params.permit(:first_name, :last_name, :email, :restaurant_name, :address, :city, :state, :zip, :phone_number, :description, :password, :password_confirmation, :current_password)
#     end
#   end
# end
