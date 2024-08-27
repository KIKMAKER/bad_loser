class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user
      @user = User.find(current_user.id)
      @recent_boards = @user.boards.order(created_at: :desc).limit(3)
      @winning_boards = @user.boards.select do |board|
        board.friendship.user == current_user ? board.user_total > board.friend_user_total : board.friend_user_total > board.user_total
      end
      @losing_boards = @user.boards.reject do |board|
        board.friendship.user == current_user ? board.user_total > board.friend_user_total : board.friend_user_total > board.user_total
      end
    end
  end

  def everyone
    @everyone = User.where.not(id: current_user.id)
    @everyone = @everyone.reject do |user|
      user.all_friendships.any? do |friendship|
        [friendship.friend_user_id, friendship.user_id].include?(current_user.id)
      end
    end
  end
end
