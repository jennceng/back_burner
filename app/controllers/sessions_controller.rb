class SessionsController < Devise::SessionsController
  def create
    binding.pry
    if current_chef.nil?
    # try to authenticate as a User
      self.resource = warden.authenticate(auth_options)
      resource_name = self.resource_name
    end

    if resource.nil?
      # try to authenticate as an AdminUser
      resource_name = :chef
      request.params[:chef] = params[:chef]

      self.resource = warden.authenticate!(auth_options.merge(scope: :chef))
    end

    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_in_path_for(resource)
  end
end
