class BoardsController < ApplicationController
  def new
    @board = Board.new
    @friendships = current_user.all_friendships
    @friendship = Friendship.find(params[:friendship_id]) if params[:friendship_id]

  end

  def show
    @board = Board.find(params[:id])
  end

  def index
    @boards = Board.joins(:friendship).where(friendships: { user_id: current_user.id }).or(Board.joins(:friendship).where(friendships: { friend_user_id: current_user.id }))
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to board_path(@board), notice: 'Board was successfully created.'
    else
      @friendships = current_user.friendships
      render :new, status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.require(:board).permit(:name, :game, :friendship_id)
  end
end
