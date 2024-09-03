class PointsController < ApplicationController
  def create
    board = params[:board]
    user = params[:user]
    point = Point.new(user_id: user, board_id: board)
    if point.save!
      redirect_to board_path(board)
    else
      redirect_to board_path(board), alert: 'Failed to add point.'
    end
  end

  def destroy
    board = params[:board]
    user = params[:user]
    point = Point.find_by(user: user, board: board)
    if point.destroy
      redirect_to board_path(board)
    else
      redirect_to board_path(board), alert: 'Failed to delete point.'
    end
  end
end
