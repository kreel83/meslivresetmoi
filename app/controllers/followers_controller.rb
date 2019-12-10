class FollowersController < ApplicationController
  def index
    @followers = Follower.where(user: current_user)
    @f = []
    @followers.each do |fol|
      @f << User.find(fol.follower)
    end
  end

  def create
    @user = User.find(params[:user])
    @follow = Follower.new
    @follow.user = current_user
    @follow.follower = @user.id
    @follow.save
    redirect_to view_followers_path
  end

  def destroy
    @user = User.find(params[:user])
    @f = Follower.where(user: current_user, follower: @user.id).first
    Follower.destroy(@f.id)
    redirect_to view_followers_path
  end
end
