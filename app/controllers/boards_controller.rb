class BoardsController < ApplicationController
  def new
    @board = Board.new
    @friendships = current_user.all_friendships
  end

  def show
    @board = Board.find(params[:id])
  end

  def index
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
