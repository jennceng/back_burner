class SignupsController < ApplicationController
  # authenticate user
  def create
    # check to see if already signed up
    # @signup = Signup.find_by(post: params[:post_id], cook: current_cook)
    # if !@signup.nil?
    #   flash[:error] = "You have already signed up for this job!"
    # end
    current_post = Post.find(params[:post_id])
    @signup = Signup.new(post: current_post, cook: current_cook)
    if @signup.save
      flash[:success] = "Job requested! Awaiting Chef's decision"
      redirect_to cook_path(current_cook)
    else
      flash[:error] = "Uh oh, something went wrong"
      recirect_to posts_path
    end
  end

end
