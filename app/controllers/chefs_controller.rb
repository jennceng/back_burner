class ChefsController < ApplicationController
  before_action :authenticate_chef

  def show
    @chef = Chef.find(params[:id])
    @posts = @chef.posts
  end

  private

  def authenticate_chef
    if current_chef.nil? || current_chef != Chef.find(params[:id])
      respond_to do |format|
        format.html { redirect_to posts_path, alert: "You cannot access that part of the website" }
        format.xml { head :forbidden }
        format.json { head :forbidden }
      end
    end
  end

end
