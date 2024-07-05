class FriendshipsController < ApplicationController
  def index
    @friendships = current_user.all_friendships
  end

  def show
    @friendship = Friendship.find(params[:id])
    @boards = @friendship.boards
  end
end
