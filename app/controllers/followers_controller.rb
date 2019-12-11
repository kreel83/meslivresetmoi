class FollowersController < ApplicationController
  def index

    @followers = Follower.where(user: current_user)
    @f = []

    @followers.each do |fol|
      user = []
      if Reading.where(user_id: fol.follower).where(status: 'ec').empty?
        user << 'none'
      else
        user <<Reading.where(user_id: fol.follower).where(status: 'ec').first.livre
      end
      user << User.find(fol.follower)
      @f << user
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
