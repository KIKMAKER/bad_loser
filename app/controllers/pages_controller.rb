class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  # at some point exclude users that are already added as friends
  def everyone
    @everyone = User.where.not(id: current_user.id)
    @everyone = @everyone.reject do |user|
      user.all_friendships.any? do |friendship|
        [friendship.friend_user_id, friendship.user_id].include?(current_user.id)
      end
    end
  end

end
