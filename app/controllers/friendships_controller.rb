class FriendshipsController < ApplicationController
  def index
    @friendships = current_user.all_friendships
  end

  def show
    @friendship = Friendship.find(params[:id])
    @boards = @friendship.boards
  end

  def create
    friend_user = User.find(params[:friend_user_id])
    @friendship = Friendship.new(user: current_user, friend_user: friend_user)
    if @friendship.save
      redirect_to everyone_path, notice: 'Friend added successfully.'
    else
      redirect_to everyone_path, alert: 'Failed to add friend.'
    end
  end
end
