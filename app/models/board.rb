class Board < ApplicationRecord
  belongs_to :friendship
  has_many :points, dependent: :destroy

  validates :name, presence: true
  validates :game, presence: true

  has_one_attached :picture

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
