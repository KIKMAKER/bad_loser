class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  # at some point exclude users that are already added as friends
  def everyone
    @everyone = User.where.not(id: current_user.id)
  end

end
