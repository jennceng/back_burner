class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # @post.chef = current_chef
    if @post.save
      flash[:success] = "New job post created!"
      redirect_to posts_path
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :date,
      :start_time,
      :end_time,
      :wage,
      :description
    ).merge(chef: current_chef)
  end

end
