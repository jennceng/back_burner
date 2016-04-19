class SessionsController < Devise::SessionsController
  def create
    binding.pry
    if self.resource_name == :cook
      if chef_signed_in?
        sign_out current_chef
        flash[:error] = "You have been signed out of a Chef account to Log In to a Cook account"
      end
      self.resource = warden.authenticate(auth_options)
    end

    if self.resource_name == :chef
      if cook_signed_in?
        sign_out current_cook
        flash[:error] = "You have been signed out of a Cook account to Log In to a Chef account"
      end
      self.resource = warden.authenticate(auth_options)
    end
    # binding.pry
    # if current_chef.nil?
    # # try to authenticate as a User
    #   self.resource = warden.authenticate(auth_options)
    #   resource_name = self.resource_name
    # end
    #
    # if resource.nil?
    #   # try to authenticate as an AdminUser
    #   resource_name = :cook
    #   request.params[:cook] = params[:chef]
    #
    #   self.resource = warden.authenticate!(auth_options.merge(scope: :cook))
    # end

    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource)
    respond_with resource, :location => after_sign_in_path_for(resource)
  end
end
