class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend_user, class_name: 'User', foreign_key: 'friend_user_id'
  has_many :boards, dependent: :destroy

  validates :user_id, presence: true
  validates :friend_user_id, presence: true

  def user_points
    boards = Board.where(friendship: self)
    total = 0
    boards.each do |board|
      total += board.user_total
    end
    return total
  end

  def friend_points
    boards = Board.where(friendship: self)
    total = 0
    boards.each do |board|
      total += board.friend_user_total
    end
    return total
  end
end
