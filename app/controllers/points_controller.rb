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
end
