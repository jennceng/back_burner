class CooksController < ApplicationController
  before_action :authenticate_cook

  def show
    @cook = Cook.find(params[:id])
    @signups = @cook.signups
  end

  private

  def authenticate_cook
    if current_cook.nil? || current_cook != Cook.find(params[:id])
      respond_to do |format|
        format.html { redirect_to posts_path, alert: "You cannot access that part of the website" }
        format.xml { head :forbidden }
        format.json { head :forbidden }
      end
    end
  end

end
