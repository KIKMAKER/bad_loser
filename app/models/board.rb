class Board < ApplicationRecord
  belongs_to :friendship
  has_many :points, dependent: :destroy

  validates :name, presence: true, length: { maximum: 12 }
  validates :game, presence: true

  def user_total
    points = self.points.where(user: self.friendship.user)
    values = points.map(&:value)
    values.sum
  end

  def friend_user_total
    points = self.points.where(user: self.friendship.friend_user)
    values = points.map(&:value)
    values.sum
  end
end
