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

  def accept
    @signup = Signup.find(params[:signup_id])
    @signup.decision = "Accepted"
    current_post = @signup.post
    if @signup.save
      current_post.update(open: false)
      pending_signups = current_post.signups - [@signup]
      pending_signups.each do |signup|
        signup.decision = "Rejected"
        signup.save
      end
      flash[:success] = "Cook selected! Job post now closed"
    else
      flash[:error] = "Uh-oh, something went wrong"
    end
    redirect_to chef_path(current_chef)
  end

  def reject
    @signup = Signup.find(params[:signup_id])
    @signup.decision = "Rejected"
    if @signup.save
      flash[:success] = "Cook Rejected"
    else
      flash[:error] = "Decision not saved"
    end
    redirect_to chef_path(current_chef)
  end

end
