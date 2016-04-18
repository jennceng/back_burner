class PostsController < ApplicationController
  before_action :authenticate_chef!, only: [:create]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "New job post created!"
      redirect_to posts_path
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      redirect_to posts_path(@post)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Job post successfully updated!"
      redirect_to posts_path
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      render :edit
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
