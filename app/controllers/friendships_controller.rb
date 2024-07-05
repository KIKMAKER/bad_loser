class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def show
    @friend = User.find(params[:id])
    @boards = Board.all.where(user: current_user)
  end
end
